import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

import '../../../../../config/config.dart';
import '../../../../../util/time.util.dart';
import '../../../../app/data/entity/failure.dart';
import '../../../../app/data/session/session.dart';
import '../../../../file/data/repository/file.repo.dart';
import '../../../data/entity/request/customer.req.e.dart';
import '../../../data/entity/response/customer.res.e.dart';
import '../../../data/repository/customer.repo.dart';

class CustomerSurveyState extends Cubit<MainState> {
  final CustomerRepo customerRepo;
  final Session session;
  final FileRepo fileRepo;

  CustomerSurveyState(this.customerRepo, this.session, this.fileRepo) : super(InitState());

  CustomerReqE? dataReq;
  CustomerResE? dataRes;
  String? localPhotoPath;

  void initState() {
    emit(LoadState());

    dataReq = CustomerReqE.initial();
    dataRes = null;
    localPhotoPath = null;

    dataReq = dataReq?.copyWith(
      petugas: session.user?.userapp,
      surveyZoneTime: TimeUtil.timeZoneOffsetServerFormat(DateTime.now()),
      tanggalSurvey: TimeUtil.dateServerFormat(DateTime.now()),
    );

    emit(DataState(true));
  }

  void getCustomerById(String id) async {
    emit(LoadState());

    var source = await customerRepo.getCustomerById(id);
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
        dataReq = dataReq?.copyWith(idPel: data.idpel);
        emit(DataState(true));
      },
    );
  }

  Future<void> saveSurvey({
    required Position position,
    required String meterBrand,
    required String meterNumber,
    required String sl,
    required String selectedRST,
    required int selectedSR,
    required double finalStand,
  }) async {
    emit(LoadState());

    var uploadPhoto = await fileRepo.postMinioUpload(dataReq!.idPel!, localPhotoPath!, 'PLG');
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
          photo: uploadPath,
          merekMeter: meterBrand,
          nomorMeter: meterBrand,
          sl: sl,
          rst: selectedRST,
          sr: selectedSR,
          standAkhir: finalStand,
          latitude: position.latitude,
          longitude: position.longitude,
        );

        /// * Simpan hasil survei ke server
        var saveSurvey = await customerRepo.postCustomerTagging(dataReq!.toCustomerReq());
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

  void updatePhoto(String path) {
    emit(LoadState());
    localPhotoPath = path;
    emit(DataState(true));
  }
}
