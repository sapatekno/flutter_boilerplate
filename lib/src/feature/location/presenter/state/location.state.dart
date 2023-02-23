import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

import '../../../../config/config.dart';
import '../../../app/data/entity/failure.dart';

class LocationState extends Cubit<MainState> {
  LocationState() : super(InitState());

  late bool serviceEnabled;
  late LocationPermission permission;

  Position? currentPosition;

  Future<void> checkService() async {
    var permission = await Geolocator.checkPermission();
    var serviceEnabled = await Geolocator.isLocationServiceEnabled();

    /// * Test if location services are enabled.
    if (!serviceEnabled) {
      /// * Location services are not enabled don't continue
      /// * accessing the position and request users of the
      /// * App to enable the location services.
      emit(AlertState(Failure.failNoLocationService()));
      emit(DataState(null));
      return;
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        /// * Permissions are denied, next time you could try
        /// * requesting permissions again (this is also where
        /// * Android's shouldShowRequestPermissionRationale
        /// * returned true. According to Android guidelines
        /// * your App should show an explanatory UI now.
        emit(AlertState(Failure.failLocationpermissionDenied()));
        emit(DataState(null));
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      /// *  Permissions are denied forever, handle appropriately.
      emit(AlertState(Failure.failLocationpermissionDeniedForever()));
      emit(DataState(null));
      return;
    }
  }

  Future<void> updateCurrentLocation() async {
    emit(LoadState());
    await checkService();

    /// * Add delay to hold user for spamming get location
    await Future.delayed(const Duration(milliseconds: 600));
    currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    emit(DataState(currentPosition));
  }

  void initState() {
    /// * Enable this if you want reset location after move page
    /// ? currentPosition = null;
    emit(DataState(null));
  }
}
