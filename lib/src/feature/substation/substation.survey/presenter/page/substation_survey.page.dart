import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_local.dart';
import 'package:go_router_flow/go_router_flow.dart';
import 'package:sizer/sizer.dart';
import 'package:surveyami/src/config/config.dart';
import 'package:surveyami/src/feature/app/presenter/widget/dialog.widget.dart';
import 'package:surveyami/src/feature/app/presenter/widget/loading.widget.dart';
import 'package:surveyami/src/feature/substation/substation.survey/presenter/state/substation_survey.state.dart';
import 'package:surveyami/src/router/go.router.dart';
import 'package:surveyami/src/util/string.util.dart';

import '../../../../../router/sl.router.dart';
import '../../../../app/data/entity/failure.dart';
import '../../../../app/data/session/session.dart';
import '../../../../location/presenter/widget/location_tagging.widget.dart';
import '../../data/entity/request/substation_detail.req.e.dart';

class SubStationSurveyPage extends StatelessWidget {
  SubStationSurveyPage({Key? key}) : super(key: key);

  final trafoController = TextEditingController(text: '0');
  final substationSearchController = TextEditingController();
  final bloc = sl.get<SubStationSurveyState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SubStationSurveyState, MainState>(
        bloc: bloc..initState(),
        builder: (context, state) {
          if (state is LoadState) return const LoadingWidget();

          return ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
                child: TextFormField(
                  controller: substationSearchController,
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: AppLocalizations.of(context)!.findSubstationNumber.toTitleCase(),
                    suffixIcon: IconButton(
                      onPressed: () {
                        if (bloc.dataRes == null) {
                          if (substationSearchController.text.isEmpty) {
                            showInfoDialog(
                              context,
                              null,
                              AppLocalizations.of(context)!.dataCannotEmptyMessage,
                              AppLocalizations.of(context)!.ok,
                              null,
                            );
                          } else {
                            bloc.getGarduById(substationSearchController.text);
                          }
                        } else {
                          showConfirmDialog(
                            context,
                            null,
                            AppLocalizations.of(context)!.resetConfirmationMessage,
                            AppLocalizations.of(context)!.yes,
                            AppLocalizations.of(context)!.cancel,
                            () {
                              bloc.getGarduById(substationSearchController.text);
                            },
                          );
                        }
                      },
                      icon: Icon(
                        bloc.dataRes == null ? Icons.search : Icons.close,
                        color: bloc.dataRes == null ? Theme.of(context).primaryColor : Colors.red,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                child: blockDataServer(context),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.5.h),
                child: blockPhoto(context),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                child: blockTrafo(context),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                child: LocationTaggingWidget(),
              ),
              Padding(
                padding: EdgeInsets.all(3.w),
                child: ElevatedButton.icon(
                  onPressed: bloc.dataRes == null ? null : () {},
                  icon: const Icon(Icons.save_alt),
                  label: Text(
                    AppLocalizations.of(context)!.save.toTitleCase(),
                  ),
                ),
              ),
            ],
          );
        },
        listenWhen: (prev, state) => state is AlertState<Failure> || state is UnauthorizedState,
        listener: (context, state) => onListener(context, state));
  }

  blockDataServer(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: Icon(Icons.cloud, color: Theme.of(context).primaryColor),
            title: Text(
              AppLocalizations.of(context)!.dataServer.toTitleCase(),
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(3.w),
            child: Table(
              defaultColumnWidth: const IntrinsicColumnWidth(),
              children: [
                TableRow(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.substationNumber.toTitleCase(),
                      style: const TextStyle(
                        height: 2,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 4.w),
                      child: const Text(" :", style: TextStyle(height: 2)),
                    ),
                    Text((bloc.dataRes?.nomorGardu ?? '-'), style: const TextStyle(height: 2)),
                  ],
                ),
                TableRow(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.latitude.toTitleCase(),
                      style: const TextStyle(
                        height: 2,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 4.w),
                      child: const Text(" :", style: TextStyle(height: 2)),
                    ),
                    Text((bloc.dataRes?.latitude ?? 0).toString(), style: const TextStyle(height: 2)),
                  ],
                ),
                TableRow(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.longitude.toTitleCase(),
                      style: const TextStyle(
                        height: 2,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 4.w),
                      child: const Text(" :", style: TextStyle(height: 2)),
                    ),
                    Text((bloc.dataRes?.longitude ?? 0).toString(), style: const TextStyle(height: 2)),
                  ],
                ),
                TableRow(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.substationType.toTitleCase(),
                      style: const TextStyle(
                        height: 2,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 4.w),
                      child: const Text(" :", style: TextStyle(height: 2)),
                    ),
                    Text((bloc.dataRes?.typeGardu ?? '-'), style: const TextStyle(height: 2)),
                  ],
                ),
                TableRow(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.description.toTitleCase(),
                      style: const TextStyle(
                        height: 2,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 4.w),
                      child: const Text(" :", style: TextStyle(height: 2)),
                    ),
                    Text((bloc.dataRes?.description ?? '-'), style: const TextStyle(height: 2)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  blockTrafo(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: BlocBuilder<SubStationSurveyState, MainState>(
            buildWhen: (prev, state) => state is DataState<TrafoControllerState>,
            builder: (context, state) {
              var trafoData = bloc.dataReq?.detailGardu?.length ?? 0;
              trafoController.text = trafoData.toString();

              return TextFormField(
                enabled: bloc.dataRes == null ? false : true,
                controller: trafoController,
                onTap: () async {
                  final List<SubStationDetailReqE>? result = await context.push(pathTrafo, extra: bloc.dataReq?.detailGardu);
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    if (result != null) {
                      // * ada penambahan
                      bloc.updateDetailGardu(result!);
                    }
                  });
                },
                readOnly: true,
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.numberOfTrafo.toTitleCase(),
                  suffixIcon: Icon(
                    Icons.chevron_right,
                    color: bloc.dataRes == null ? Colors.grey : Theme.of(context).primaryColor,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  onListener(BuildContext context, MainState state) {
    if (state is AlertState<Failure>) {
      var failure = state.data;
      showInfoDialog(
        context,
        null,
        Failure.getMessage(context, failure.message ?? "unknown"),
        AppLocalizations.of(context)!.ok,
        null,
      );
    }

    if (state is UnauthorizedState) {
      showInfoDialog(
        context,
        null,
        AppLocalizations.of(context)!.unauthorizedMessage,
        AppLocalizations.of(context)!.login,
        () async {
          var session = sl.get<Session>();
          await session.remove();
          context.go(pathInitial);
        },
      );
    }
  }

  blockPhoto(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.camera_alt),
          label: const Text('Ambil Foto'),
        )
      ],
    );
  }
}
