import 'package:go_router_flow/go_router_flow.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '../feature/auth/auth.login/presenter/page/login.page.dart';
import '../feature/home/presenter/page/home.page.dart';
import '../feature/substation/substation.survey/data/entity/request/substation_detail.req.e.dart';
import '../feature/substation/substation.trafo/presenter/page/trafo.form.page.dart';
import '../feature/substation/substation.trafo/presenter/page/trafo.page.dart';
import 'sl.router.dart';

String pathInitial = '/';
String pathHome = '/home';
String pathTalker = '/talker';
String pathTrafo = '/trafo';
String pathTrafoForm = '/trafo/form';

final goRouter = GoRouter(
  routes: [
    GoRoute(
      path: pathInitial,
      builder: (context, state) => LoginPage(),
    ),
    GoRoute(
      path: pathHome,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: pathTalker,
      builder: (context, state) => TalkerScreen(talker: sl.get<Talker>()),
    ),
    GoRoute(
      path: pathTrafo,
      builder: (context, state) {
        var data = state.extra as List<SubStationDetailReqE>?;
        return TrafoPage(data);
      },
    ),
    GoRoute(
      path: pathTrafoForm,
      builder: (context, state) {
        var data = state.extra as SubStationDetailReqE?;
        return TrafoFormPage(data);
      },
    ),
  ],
);
