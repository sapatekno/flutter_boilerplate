import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nested/nested.dart';

import '../feature/auth/auth.login/presenter/state/login.state.dart';
import '../feature/location/presenter/state/location.state.dart';
import 'sl.router.dart';

class CubitRouter {
  static List<SingleChildWidget> getProviders() {
    return [
      BlocProvider<LoginState>(create: (_) => sl.get<LoginState>(), lazy: true),
      BlocProvider<LocationState>(create: (_) => sl.get<LocationState>(), lazy: true),
    ];
  }
}
