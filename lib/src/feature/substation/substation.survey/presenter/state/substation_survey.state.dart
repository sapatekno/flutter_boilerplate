import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator_platform_interface/src/models/position.dart';
import 'package:surveyami/src/feature/substation/substation.survey/data/entity/request/substation.req.e.dart';
import 'package:surveyami/src/util/time.util.dart';

import '../../../../../config/config.dart';
import '../../../../app/data/entity/failure.dart';
import '../../../../app/data/session/session.dart';
import '../../../../file/data/repository/file.repo.dart';
import '../../../data/repository/substation.repo.dart';
import '../../data/entity/request/substation_detail.req.e.dart';
import '../../data/entity/response/substation.res.e.dart';

class SubStationSurveyState extends Cubit<MainState> {
  final SubStationRepo subStationRepo;
  final Session session;
  final FileRepo fileRepo;

  SubStationSurveyState(this.subStationRepo, this.session, this.fileRepo) : super(InitState());

  SubstationReqE? dataReq;
  SubStationResE? dataRes;
  String? localPhotoPath;

  void initState() {
    emit(LoadState());

    dataReq = SubstationReqE.initial();
    dataRes = null;
    localPhotoPath = null;

    dataReq = dataReq?.copyWith(
      petugas: session.user?.userapp,
      surveyZoneTime: TimeUtil.timeZoneOffsetServerFormat(DateTime.now()),
      tanggalSurvey: TimeUtil.dateServerFormat(DateTime.now()),
    );

    emit(DataState(true));
  }

  void updateDetailGardu(List<SubStationDetailReqE> listData) {
    emit(LoadState());
    dataReq = dataReq?.copyWith(
      detailGardu: listData,
      jumlahTrafo: listData.length,
    );
    emit(DataState(true));
  }

  void getGarduById(String id) async {
    emit(LoadState());

    var source = await subStationRepo.getGarduById(id);
    source.fold(
      (failure) {
        initState();
        if (Failure.isUnauthorized(failure.error)) {
          emit(UnauthorizedState());
          emit(DataState(true));
          return;
        }
        emit(AlertState(failure));
        emit(DataState(true));
      },
      (data) {
        dataRes = data;
        dataReq = dataReq?.copyWith(nomorGardu: data.nomorGardu);
        emit(DataState(true));
      },
    );
  }

  void updatePhoto(String path) {
    emit(LoadState());
    localPhotoPath = path;
    emit(DataState(true));
  }

  void saveSurvey(Position position) async {
    emit(LoadState());

    var uploadPhoto = await fileRepo.postMinioUpload(dataReq!.nomorGardu!, localPhotoPath!);
    uploadPhoto.fold(
      (failure) {
        if (Failure.isUnauthorized(failure.error)) {
          emit(UnauthorizedState());
          emit(DataState(true));
          return;
        }
        emit(AlertState(failure));
        emit(DataState(true));
      },
      (uploadPath) async {
        dataReq = dataReq?.copyWith(
          akurasi: position.accuracy,
          latitude: position.latitude,
          longitude: position.longitude,
          photo: uploadPath,
        );

        /// * Simpan hasil survei ke server
        var saveSurvey = await subStationRepo.postGarduTagging(dataReq!.toSubstationReq());
        saveSurvey.fold(
          (failure) {
            if (Failure.isUnauthorized(failure.error)) {
              emit(UnauthorizedState());
              emit(DataState(true));
              return;
            }
            emit(AlertState(failure));
            emit(DataState(true));
          },
          (data) {
            initState();
            emit(AlertState(data));
          },
        );
      },
    );
  }
}
