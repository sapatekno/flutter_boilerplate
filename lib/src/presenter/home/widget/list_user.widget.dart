import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/sl.app.dart';
import '../../../app/state.app.dart';
import '../../../data/entity/user.dart';
import '../../app/widget/failure.widget.dart';
import '../../app/widget/loading.widget.dart';
import '../../user/cubit/home.cubit.dart';

class ListUserWidget extends StatelessWidget {
  ListUserWidget({Key? key}) : super(key: key);

  final HomeCubit homeCubit = sl.get<HomeCubit>();
  final controller = EasyRefreshController(
      controlFinishRefresh: true, controlFinishLoad: true);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, StateApp>(
        bloc: homeCubit..getUsers(listState: ListState.init),
        listenWhen: (prevState, state) => state is DataState<ListState>,
        listener: (context, state) {
          if (state is DataState<ListState>) {
            if (state.data == ListState.refreshDone)
              controller.finishRefresh(IndicatorResult.success);
            if (state.data == ListState.refreshFail)
              controller.finishRefresh(IndicatorResult.fail);
            if (state.data == ListState.loadDone)
              controller.finishLoad(IndicatorResult.success);
            if (state.data == ListState.loadFail)
              controller.finishLoad(IndicatorResult.fail);
          }
        },
        buildWhen: (prevState, state) =>
            state is LoadState ||
            state is DataState<List<User>> ||
            state is FailState,
        builder: (context, state) {
          if (state is LoadState) return const LoadingWidget();
          if (state is FailState)
            return FailureWidget(
                callback: () => homeCubit.getUsers(listState: ListState.init));

          if (state is DataState<List<User>>) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: EasyRefresh(
                controller: controller,
                onRefresh: () async {
                  controller.callRefresh();
                  homeCubit.getUsers(listState: ListState.refresh);
                },
                onLoad: () async {
                  if (homeCubit.currentPage >= homeCubit.currentTotalPage) {
                    controller.finishLoad(IndicatorResult.noMore);
                  } else {
                    controller.callLoad();
                    homeCubit.getUsers(
                        page: homeCubit.currentPage + 1,
                        listState: ListState.load);
                  }
                },
                child: ListView.builder(
                  itemCount: state.data.length,
                  itemBuilder: (context, index) => Card(
                    child: InkWell(
                      borderRadius: const BorderRadius.all(Radius.circular(4)),
                      onTap: () {},
                      child: ListTile(
                        leading: CircleAvatar(
                            backgroundImage:
                                NetworkImage(state.data[index].avatar ?? '')),
                        title: Text(
                            '${state.data[index].firstName} ${state.data[index].lastName}'),
                        subtitle: Text(state.data[index].email ?? '-'),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
          return Container();
        });
  }
}
