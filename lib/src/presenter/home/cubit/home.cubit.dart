import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/state.app.dart';

abstract class HomeCubit extends Cubit<StateApp> {
  HomeCubit(super.initialState);

  Future<void> getUsers({int page = 1, required ListState listState});

  int get currentPage;

  int get currentTotalPage;
}
