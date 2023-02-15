import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surveyami/src/feature/substation/substation.survey/data/entity/request/substation.req.e.dart';

import '../../../../../config/config.dart';
import '../../../../app/data/entity/failure.dart';
import '../../../data/repository/substation.repo.dart';
import '../../data/entity/request/substation_detail.req.e.dart';
import '../../data/entity/response/substation.res.e.dart';

class SubStationSurveyState extends Cubit<MainState> {
  final SubStationRepo subStationRepo;

  SubStationSurveyState(this.subStationRepo) : super(InitState());

  SubstationReqE? dataReq;
  SubStationResE? dataRes;

  void initState() {
    emit(LoadState());

    dataReq = const SubstationReqE(
      akurasi: 0,
      detailGardu: [],
      jumlahTrafo: 0,
      latitude: 0,
      longitude: 0,
      nomorGardu: '',
      petugas: '',
      surveyZoneTime: '',
      tanggalSurvey: '',
    );

    emit(DataState(dataReq));
  }

  void updateDetailGardu(List<SubStationDetailReqE> listData) {
    emit(LoadState());
    dataReq = dataReq?.copyWith(detailGardu: listData);
    emit(DataState(TrafoControllerState()));
  }

  void getGarduById(String id) async {
    emit(LoadState());

    var source = await subStationRepo.getGarduById(id);
    source.fold(
      (failure) {
        if (Failure.isUnauthorized(failure.error)) {
          emit(UnauthorizedState());
          return;
        }
        dataRes = null;
        emit(AlertState(failure));
      },
      (data) {
        dataRes = data;
        emit(DataState(data));
      },
    );
  }
}

class TrafoControllerState {}
