import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotrootweb/constant/constant.dart';
import 'package:spotrootweb/controlls/locationController.dart';
import 'package:spotrootweb/controlls/mutationController.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({super.key});

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  late GoogleMapController mapController;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.bgPrimary,
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Get.find<LocationController>().currentAddress = '';
              Get.back();
            },
            icon: const Icon(Icons.close)),
      ),
      body: GetBuilder<LocationController>(
          init: LocationController(),
          builder: (map) {
            if (map.currentPosition == null) {
              return Container(
                padding:const  EdgeInsets.all(15),
                height: 100.h,
                width: 100.w,
                color: Constant.bgPrimary,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const MutationLoader(),
                      SizedBox(
                        height: .5.h,
                      ),
                      Constant.textWithStyle(
                          text: 'Please wait fetching current location',
                          color: Constant.textSecondary,
                          fontWeight: FontWeight.w500,
                          size: 15.sp,
                          textAlign: TextAlign.center,
                          maxLine: 5),
                      SizedBox(
                        height: .5.h,
                      ),
                      Constant.textWithStyle(
                        text:
                            'Make sure you location access is enabled for spotroot application.',
                        color: Constant.bgRed,
                        fontWeight: FontWeight.normal,
                        textAlign: TextAlign.center,
                        maxLine: 5,
                        size: 14.sp,
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Stack(
                children: [
                  GoogleMap(
                    zoomControlsEnabled: false,
                    zoomGesturesEnabled: true,
                    buildingsEnabled: true,
                    initialCameraPosition: CameraPosition(
                      target: LatLng(
                          map.currentPosition!.latitude,
                          map.currentPosition!
                              .longitude), // Initial map location (San Francisco)
                      zoom: 16.0,
                    ),
                    mapType: MapType.normal,
                    onMapCreated: (GoogleMapController controller) {
                      mapController = controller;
                    },

                    onCameraMove: (position) {
                      if (map.latLng != position.target) {
                        map.latLng = position.target;
                      }
                    },
                    onCameraIdle: () {
                      map.getAddressFromLatLng(
                          lat: map.latLng!.latitude,
                          lng: map.latLng!.longitude);
                    },
                    // markers: {
                    //   Marker(
                    //     markerId: const MarkerId('currentMarker'),
                    //     position: map.latLng!,
                    //     icon: BitmapDescriptor.defaultMarkerWithHue(
                    //         BitmapDescriptor.hueCyan),
                    //   ),
                    // },
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'lib/constant/icons/pin.png',
                      scale: 15,
                      color: Constant.bgRed,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Container(
                            width: 15.w,
                            height: 15.w,
                            decoration: BoxDecoration(
                                color: Constant.bgSecondary,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: IconButton(
                                icon: Icon(
                                  Icons.my_location_rounded,
                                  size: 22.sp,
                                  color: Constant.bgRed,
                                ),
                                onPressed: () {
                                  map.getCurrentPosition();
                                  mapController.animateCamera(
                                      CameraUpdate.newCameraPosition(
                                          CameraPosition(
                                              target: LatLng(
                                                  map.currentPosition!.latitude,
                                                  map.currentPosition!
                                                      .longitude),
                                              zoom: 16)));
                                },
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            height: 20.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                                color: Constant.bgSecondary,
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Constant.textWithStyle(
                                      text: map.localityName,
                                      fontWeight: FontWeight.w600,
                                      size: 16.sp,
                                      color: Constant.textPrimary),
                                  SizedBox(
                                    height: .5.h,
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                    child: Constant.textWithStyle(
                                        text: map.localityAdress,
                                        maxLine: 3,
                                        fontWeight: FontWeight.normal,
                                        size: 14.sp,
                                        color: Constant.textSecondary),
                                  ),
                                  ElevatedButton(
                                    onPressed: () async {
                                      Get.back();
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Constant.bgGreen,
                                        elevation: 0,
                                        fixedSize: Size(100.w, 5.h),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                    child: Constant.textWithStyle(
                                      text: 'Confirm & Continue',
                                      size: 15.sp,
                                      color: Constant.bgWhite,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ]),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
          }),
    );
  }
}
