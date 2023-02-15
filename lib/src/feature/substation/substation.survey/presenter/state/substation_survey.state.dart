import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surveyami/src/feature/substation/substation.survey/data/entity/request/substation.req.e.dart';
import 'package:surveyami/src/feature/substation/substation.survey/data/entity/request/substation_detail.req.e.dart';

import '../../../../../config/config.dart';

class SubStationSurveyState extends Cubit<MainState> {
  SubStationSurveyState() : super(InitState());

  SubstationReqE? data;

  void initState() {
    emit(LoadState());

    data = const SubstationReqE(
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

    emit(DataState(data));
  }

  void updateDetailGardu(List<SubStationDetailReqE> listData) {
    emit(LoadState());
    data = data?.copyWith(detailGardu: listData);
    emit(DataState(TrafoControllerState()));
  }
}

class TrafoControllerState {}
