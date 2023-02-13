import 'package:go_router/go_router.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '../feature/auth/auth.login/presenter/page/login.page.dart';
import '../feature/home/presenter/page/home.page.dart';
import 'sl.router.dart';

String pathInitial = '/';
String pathHome = '/home';
String pathTalker = '/talker';

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
  ],
);
