import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nested/nested.dart';
import 'package:surveyami/src/feature/customer/customer.survey/presenter/state/customer_survey.state.dart';

import '../feature/auth/auth.login/presenter/state/login.state.dart';
import '../feature/location/presenter/state/location.state.dart';
import '../feature/substation/substation.survey/presenter/state/substation_survey.state.dart';
import '../feature/substation/substation.trafo/presenter/state/trafo.state.dart';
import 'sl.router.dart';

class CubitRouter {
  static List<SingleChildWidget> getProviders() {
    return [
      BlocProvider<LoginState>(create: (_) => sl.get<LoginState>(), lazy: true),
      BlocProvider<LocationState>(create: (_) => sl.get<LocationState>(), lazy: true),
      BlocProvider<TrafoState>(create: (_) => sl.get<TrafoState>(), lazy: true),
      BlocProvider<SubStationSurveyState>(create: (_) => sl.get<SubStationSurveyState>(), lazy: true),
      BlocProvider<CustomerSurveyState>(create: (_) => sl.get<CustomerSurveyState>(), lazy: true),
    ];
  }
}
