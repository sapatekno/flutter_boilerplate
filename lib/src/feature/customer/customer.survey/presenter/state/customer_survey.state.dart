import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

import '../../../../../config/config.dart';
import '../../../../../util/time.util.dart';
import '../../../../app/data/entity/failure.dart';
import '../../../../app/data/session/session.dart';
import '../../../data/entity/request/customer.req.e.dart';
import '../../../data/entity/response/customer.res.e.dart';
import '../../../data/repository/customer.repo.dart';

class CustomerSurveyState extends Cubit<MainState> {
  final CustomerRepo customerRepo;
  final Session session;

  CustomerSurveyState(this.customerRepo, this.session) : super(InitState());

  CustomerReqE? dataReq;
  CustomerResE? dataRes;

  void initState() {
    emit(LoadState());

    dataReq = CustomerReqE.initial();
    dataRes = null;

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

  Future<void> saveSurvey(Position position) async {
    emit(LoadState());
    dataReq = dataReq?.copyWith(
      akurasi: position.accuracy,
      latitude: position.latitude,
      longitude: position.longitude,
    );

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
  }
}
