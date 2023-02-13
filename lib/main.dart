import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import 'src/app/material.app/material.app.view.dart';
import 'src/config/config.dart';
import 'src/router/cubit.router.dart';
import 'src/router/sl.router.dart' as sl;

/// * This is poin when you want init third parties libraries (e.g. Firebase).
Future<void> init(Config config) async {
  await sl.init(config);
}

class MainApp extends StatelessWidget {
  final Config config;

  const MainApp(this.config, {super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: CubitRouter.getProviders(),
      child: Sizer(builder: (context, orientation, deviceType) {
        return const MaterialAppView();
      }),
    );
  }
}
