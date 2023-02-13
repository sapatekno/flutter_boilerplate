import 'package:go_router/go_router.dart';

import '../feature/auth/auth.login/presenter/page/login.page.dart';
import '../feature/home/presenter/page/home.page.dart';

String pathInitial = '/';
String pathHome = '/home';

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
  ],
);
