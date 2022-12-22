import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../app/material.app/cubit/material.app.cubit.dart';
import '../../../app/sl.app.dart';
import '../../../app/state.app.dart';
import '../../../data/entity/user.dart';
import '../../app/widget/loading.widget.dart';
import '../cubit/home.cubit.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  final HomeCubit homeCubit = sl.get<HomeCubit>();
  final MaterialAppCubit materialAppCubit = sl.get<MaterialAppCubit>();
  final _controller = EasyRefreshController(controlFinishRefresh: true, controlFinishLoad: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(title: const Text('List User')),
      body: BlocConsumer<HomeCubit, StateApp>(
          bloc: homeCubit..getUsers(listState: ListState.init),
          listenWhen: (prevState, state) => state is DataState<ListState>,
          listener: (context, state) {
            if (state is DataState<ListState>) {
              if (state.data == ListState.refreshDone) _controller.finishRefresh(IndicatorResult.success);
              if (state.data == ListState.refreshFail) _controller.finishRefresh(IndicatorResult.fail);
              if (state.data == ListState.loadDone) _controller.finishLoad(IndicatorResult.success);
              if (state.data == ListState.loadFail) _controller.finishLoad(IndicatorResult.fail);
            }
          },
          buildWhen: (prevState, state) => state is LoadState || state is DataState<List<User>> || state is FailState,
          builder: (context, state) {
            if (state is LoadState) return const LoadingWidget();
            if (state is DataState<List<User>>) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: EasyRefresh(
                  controller: _controller,
                  onRefresh: () async {
                    _controller.callRefresh();
                    homeCubit.getUsers(listState: ListState.refresh);
                  },
                  onLoad: () async {
                    if (homeCubit.currentPage >= homeCubit.currentTotalPage) {
                      _controller.finishLoad(IndicatorResult.noMore);
                    } else {
                      _controller.callLoad();
                      homeCubit.getUsers(page: homeCubit.currentPage + 1, listState: ListState.load);
                    }
                  },
                  child: ListView.builder(
                    itemCount: state.data.length,
                    itemBuilder: (context, index) => Card(
                      child: InkWell(
                        borderRadius: const BorderRadius.all(Radius.circular(4)),
                        onTap: () {},
                        child: ListTile(
                          leading: CircleAvatar(backgroundImage: NetworkImage(state.data[index].avatar ?? '')),
                          title: Text('${state.data[index].firstName} ${state.data[index].lastName}'),
                          subtitle: Text(state.data[index].email ?? '-'),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }
            return Container();
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          materialAppCubit.setTextTheme(GoogleFonts.comicNeueTextTheme());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
