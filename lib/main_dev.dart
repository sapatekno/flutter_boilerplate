import 'package:flutter/material.dart';

import 'main.dart' as app;
import 'src/config/dev.config.dart';

final config = DevConfig();

Future<void> main() async {
  /// * Make sure all flutter libraries ready for another third party library.
  WidgetsFlutterBinding.ensureInitialized();
  await app.init(config);

  runApp(app.MainApp(config));
}
