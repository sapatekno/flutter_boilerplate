import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../state.app.dart';

abstract class MaterialAppCubit extends Cubit<StateApp> {
  MaterialAppCubit(super.initialState);

  TextTheme get textTheme;

  void setTextTheme(TextTheme textTheme);
}
