import 'package:catcher/catcher.dart';
import 'package:flutter/material.dart';

import 'main.dart' as app;
import 'src/config/dev.config.dart';
import 'src/router/sl.router.dart';

final config = DevConfig();

Future<void> main() async {
  /// * Make sure all flutter libraries ready for another third party library.
  WidgetsFlutterBinding.ensureInitialized();
  await app.init(config);

  /// * Catcher Configuration for Development
  CatcherOptions debugOptions = CatcherOptions(
    SilentReportMode(),
    [
      DiscordHandler(
        'https://discordapp.com/api/webhooks/1078175655046414377/kMRBJGQ5XVItzE2fuOKlryyZ3cLCMbkYMOyJDKVuTXwwaw1R_3i5e_zwR47kxk5zOj1P',
        enableApplicationParameters: false,
        enableCustomParameters: false,
        enableDeviceParameters: false,
        enableStackTrace: false,
        printLogs: false,
      ),
    ],
  );

  Catcher(
    navigatorKey: sl.get<GlobalKey<NavigatorState>>(),
    rootWidget: app.MainApp(config),
    debugConfig: debugOptions,
  );
}
