import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../presenter/home/view/home.view.dart';
import '../sl.app.dart';
import '../state.app.dart';
import 'cubit/material.app.cubit.dart';

class MaterialAppView extends StatelessWidget {
  MaterialAppView({Key? key}) : super(key: key);

  final MaterialAppCubit materialAppCubit = sl.get<MaterialAppCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaterialAppCubit, StateApp>(
      builder: (context, state) {
        return MaterialApp(
          title: 'Flutter Boilerplate',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: materialAppCubit.textTheme,
          ),
          home: HomeView(),
        );
      },
    );
  }
}
