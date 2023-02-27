import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_local.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:sizer/sizer.dart';
import 'package:surveyami/src/feature/app/presenter/widget/dialog.widget.dart';
import 'package:surveyami/src/util/string.util.dart';

import '../../../../config/config.dart';
import '../../../../router/sl.router.dart';
import '../../../app/data/entity/failure.dart';
import '../state/location.state.dart';

class LocationTaggingWidget extends StatelessWidget {
  LocationTaggingWidget({Key? key}) : super(key: key);

  final cubit = sl.get<LocationState>();
  final mapController = MapController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LocationState, MainState>(
      bloc: cubit..initState(),
      listenWhen: (prev, current) => current is AlertState || current is DataState,
      listener: (context, state) => onListener(context, state),
      builder: (context, state) {
        return Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              cubit.currentPosition != null
                  ? SizedBox(
                      width: double.maxFinite,
                      height: 15.h,
                      child: FlutterMap(
                        mapController: mapController,
                        options: MapOptions(
                          interactiveFlags: InteractiveFlag.all & ~InteractiveFlag.rotate & ~InteractiveFlag.doubleTapZoom,
                          center: LatLng(cubit.currentPosition!.latitude, cubit.currentPosition!.longitude),
                          minZoom: 15,
                          zoom: 16,
                          maxZoom: 17,
                        ),
                        children: [
                          TileLayer(
                            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                            userAgentPackageName: 'id.co.plniconplus',
                          ),
                          MarkerLayer(
                            markers: [
                              Marker(
                                point: LatLng(cubit.currentPosition!.latitude, cubit.currentPosition!.longitude),
                                builder: (context) => Icon(Icons.location_on, color: Theme.of(context).primaryColor),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  : ListTile(
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
                          cubit.currentPosition != null ? cubit.currentPosition!.latitude.toString() : '-',
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
                          cubit.currentPosition != null ? cubit.currentPosition!.longitude.toString() : '-',
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
                          cubit.currentPosition != null ? '${cubit.currentPosition!.accuracy.toStringAsFixed(2)}m' : '-',
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
                            onPressed: state is DataState ? () => cubit.updateCurrentLocation() : null,
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

  void onListener(BuildContext context, MainState state) async {
    if (cubit.currentPosition != null) {
      /// ? Give time to MapView Render First
      Future.delayed(const Duration(milliseconds: 500)).then((value) {
        mapController.move(LatLng(cubit.currentPosition!.latitude, cubit.currentPosition!.longitude), 16);
      });
    }

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
