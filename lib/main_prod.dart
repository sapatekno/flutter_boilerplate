import 'package:flutter/material.dart';

import 'main.dart' as app;
import 'src/config/prod.config.dart';

final config = ProdConfig();

Future<void> main() async {
  /// * Make sure all flutter libraries ready for another third party library.
  WidgetsFlutterBinding.ensureInitialized();
  await app.init(config);

  runApp(app.MainApp(config));
}
