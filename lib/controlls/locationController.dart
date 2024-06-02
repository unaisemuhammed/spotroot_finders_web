
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:spotrootweb/widgets/utilis.dart';

class LocationController extends GetxController {
  bool _fetchingLocation = false;
  String _currentAddress = '';
  Position? currentPosition;
  LatLng? _latLngL = const LatLng(13.431240, 79.700562);
  String _localityName = '';
  String _localityAdress = '';

  get localityName => _localityName;
  set localityName(v) {
    _localityName = v;
    update();
  }

  get localityAdress => _localityAdress;
  set localityAdress(v) {
    _localityAdress = v;
    update();
  }

  LatLng? get latLng => _latLngL;
  set latLng(v) {
    _latLngL = v;
    update();
  }

  get fetchingLocation => _fetchingLocation;
  set fetchingLocation(v) {
    _fetchingLocation = v;
    update();
  }

  get currentAddress => _currentAddress;
  set currentAddress(v) {
    _currentAddress = v;
    update();
  }

  Future<bool> handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Utilis.snackBar(
          title: 'Location Permission',
          message: 'Location services are disabled. Please enable the services',
          failure: false);
      Future.error('Location services are disabled.');
      fetchingLocation = false;
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Utilis.snackBar(
            title: 'Location Permission',
            message:
                'Location services are disabled. Please enable the services',
            failure: false);
        Future.error('Location permissions are denied');
        fetchingLocation = false;

        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      Utilis.snackBar(
          title: 'Location Permission',
          message: 'Location services are disabled. Please enable the services',
          failure: false);
      Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
      fetchingLocation = false;

      return false;
    }

    return true;
  }

  Future<void> getCurrentPosition() async {
    final hasPermission = await handleLocationPermission();
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      currentPosition = position;
      latLng = LatLng(currentPosition!.latitude, currentPosition!.latitude);

      print('Current Position of Trainer is : $currentPosition');
      update();
      getAddressFromLatLng(
          lat: currentPosition!.latitude, lng: currentPosition!.longitude);
      update();
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> getAddressFromLatLng({
    required double lat,
    required double lng,
  }) async {
    await placemarkFromCoordinates(lat, lng).then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      currentAddress =
          "${place.locality} ${place.street} ${place.administrativeArea} ${place.postalCode} ${place.subLocality} ${place.thoroughfare}";
      localityName = place.locality;
      localityAdress =
          "${place.street} ${place.administrativeArea} ${place.postalCode} ${place.subLocality} ${place.thoroughfare}";
      debugPrint("Adress Of Current Positon: $place");
      update();
    }).catchError((e) {
      debugPrint(e);
    });
  }
}
