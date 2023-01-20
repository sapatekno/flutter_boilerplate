import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/state.app.dart';
import '../../../../data/entity/user.dart';
import '../../../../data/repository/user.repository.dart';
import '../home.cubit.dart';

class HomeCubitImpl extends Cubit<StateApp> implements HomeCubit {
  final UserRepository userRepository;

  HomeCubitImpl(this.userRepository) : super(InitState());

  @override
  int currentPage = 1;

  @override
  int currentTotalPage = 1;

  List<User> currentListUser = [];

  @override
  Future<void> getUsers({int page = 1, required ListState listState}) async {
    if (listState == ListState.init) emit(LoadState());
    var source = await userRepository.getUsers(page: page);
    source.fold(
      (failure) {
        if (listState == ListState.init) emit(FailState(failure));
        if (listState == ListState.refresh) emit(DataState<ListState>(ListState.refreshFail));
        if (listState == ListState.load) emit(DataState<ListState>(ListState.loadFail));
      },
      (data) {
        currentPage = data.page ?? 1;
        currentTotalPage = data.totalPages ?? 1;

        if (currentPage <= 1) currentListUser.clear();
        currentListUser.addAll(data.data!);

        emit(DataState<List<User>>(currentListUser));
        if (listState == ListState.refresh)
          emit(DataState<ListState>(ListState.refreshDone));
        if (listState == ListState.load)
          emit(DataState<ListState>(ListState.loadDone));
      },
    );
  }

  @override
  Future<void> close() {
    return super.close();
  }

  @override
  void cancelRequest() {
    print('i am closed');
  }
}
