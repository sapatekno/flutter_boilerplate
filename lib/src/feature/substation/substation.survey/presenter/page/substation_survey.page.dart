import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_local.dart';
import 'package:go_router_flow/go_router_flow.dart';
import 'package:sizer/sizer.dart';
import 'package:surveyami/src/config/config.dart';
import 'package:surveyami/src/feature/substation/substation.survey/presenter/state/substation_survey.state.dart';
import 'package:surveyami/src/router/go.router.dart';
import 'package:surveyami/src/util/string.util.dart';

import '../../../../../router/sl.router.dart';
import '../../../../location/presenter/widget/location_tagging.widget.dart';
import '../../data/entity/request/substation_detail.req.e.dart';

class SubStationSurveyPage extends StatelessWidget {
  SubStationSurveyPage({Key? key}) : super(key: key);

  final trafoController = TextEditingController(text: '0');
  final bloc = sl.get<SubStationSurveyState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
        bloc: bloc..initState(),
        builder: (context, state) {
          return ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
                child: TextFormField(
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: AppLocalizations.of(context)!.findSubstationNumber.toTitleCase(),
                    suffixIcon: IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.search,
                        color: Theme.of(context).primaryColor,
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
                  onPressed: null,
                  icon: const Icon(Icons.save_alt),
                  label: Text(
                    AppLocalizations.of(context)!.save.toTitleCase(),
                  ),
                ),
              ),
            ],
          );
        },
        listener: (context, state) {});
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
                    const Text('-', style: TextStyle(height: 2)),
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
                    const Text('-', style: TextStyle(height: 2)),
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
                    const Text('-', style: TextStyle(height: 2)),
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
                    const Text('-', style: TextStyle(height: 2)),
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
                    const Text('-', style: TextStyle(height: 2)),
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
              var trafoData = bloc.data?.detailGardu?.length ?? 0;
              trafoController.text = trafoData.toString();

              return TextFormField(
                controller: trafoController,
                onTap: () async {
                  final List<SubStationDetailReqE>? result = await context.push(pathTrafo, extra: bloc.data?.detailGardu);
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
                  suffixIcon: const Icon(Icons.chevron_right),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
