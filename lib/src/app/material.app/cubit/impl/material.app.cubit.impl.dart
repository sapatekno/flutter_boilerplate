import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../state.app.dart';
import '../material.app.cubit.dart';

class MaterialAppCubitImpl extends MaterialAppCubit {
  MaterialAppCubitImpl() : super(InitState());

  @override
  TextTheme textTheme = GoogleFonts.ubuntuTextTheme();

  @override
  void setTextTheme(TextTheme textTheme) {
    this.textTheme = textTheme;
    emit(DataState<MiniState>(MiniState.done));
  }
}
