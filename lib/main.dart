import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/src/app/material.app/cubit/material.app.cubit.dart';
import 'package:flutter_boilerplate/src/app/material.app/material.app.view.dart';
import 'package:flutter_boilerplate/src/app/sl.app.dart' as sl;
import 'package:flutter_boilerplate/src/presenter/home/cubit/home.cubit.dart';

Future<void> main() async {
  /// * Make sure all flutter libraries ready for another third party library.
  WidgetsFlutterBinding.ensureInitialized();

  await sl.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MaterialAppCubit>(create: (_) => sl.sl.get<MaterialAppCubit>(), lazy: false),
        BlocProvider<HomeCubit>(create: (_) => sl.sl.get<HomeCubit>(), lazy: true),
      ],
      child: MaterialAppView(),
    );
  }
}
