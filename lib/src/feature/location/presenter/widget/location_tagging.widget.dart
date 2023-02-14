import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_local.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sizer/sizer.dart';
import 'package:surveyami/src/feature/app/presenter/widget/dialog.widget.dart';
import 'package:surveyami/src/util/string.util.dart';

import '../../../../config/config.dart';
import '../../../../router/sl.router.dart';
import '../../../app/data/entity/failure.dart';
import '../state/location.state.dart';

class LocationTaggingWidget extends StatelessWidget {
  LocationTaggingWidget({Key? key}) : super(key: key);

  final locationState = sl.get<LocationState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LocationState, MainState>(
      bloc: locationState..initState(),
      listenWhen: (prev, current) => current is AlertState,
      listener: (context, state) => onListener(context, state),
      builder: (context, state) {
        return Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: Icon(Icons.map, color: Theme.of(context).primaryColor),
                title: Text(
                  AppLocalizations.of(context)!.dataTagging.toTitleCase(),
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
                          AppLocalizations.of(context)!.latitude.toTitleCase(),
                          style: const TextStyle(
                            height: 2,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 4.w),
                          child: const Text(" :", style: TextStyle(height: 2)),
                        ),
                        Text(
                          locationState.currentPosition != null ? locationState.currentPosition!.latitude.toString() : '-',
                          style: const TextStyle(height: 2),
                        ),
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
                        Text(
                          locationState.currentPosition != null ? locationState.currentPosition!.longitude.toString() : '-',
                          style: const TextStyle(height: 2),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text(
                          AppLocalizations.of(context)!.accuracy.toTitleCase(),
                          style: const TextStyle(
                            height: 2,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 4.w),
                          child: const Text(" :", style: TextStyle(height: 2)),
                        ),
                        Text(
                          locationState.currentPosition != null ? '${locationState.currentPosition!.accuracy.toStringAsFixed(2)}m' : '-',
                          style: const TextStyle(height: 2),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(3.w),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    BlocBuilder<LocationState, MainState>(
                        buildWhen: (prev, current) => state is LoadState || state is DataState,
                        builder: (context, state) {
                          return ElevatedButton.icon(
                            onPressed: state is DataState ? () => locationState.updateCurrentLocation() : null,
                            icon: const Icon(Icons.refresh),
                            label: Text(state is DataState ? AppLocalizations.of(context)!.updateLocation.toTitleCase() : AppLocalizations.of(context)!.loading.toTitleCase()),
                          );
                        }),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void onListener(BuildContext context, MainState state) {
    if (state is AlertState<Failure>) {
      String description = AppLocalizations.of(context)!.noData;
      if (state.data.message != null) description = Failure.getMessage(context, state.data.message!);

      showConfirmDialog(
        context,
        null,
        description,
        state.data.message == 'failNoLocationService' ? AppLocalizations.of(context)!.openLocationSettings : AppLocalizations.of(context)!.openApplicationSettings,
        AppLocalizations.of(context)!.cancel,
        () => state.data.message == 'failNoLocationService' ? Geolocator.openLocationSettings() : Geolocator.openAppSettings(),
      );
    }
  }
}
