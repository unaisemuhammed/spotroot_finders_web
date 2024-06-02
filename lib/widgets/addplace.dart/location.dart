// ignore: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotrootweb/constant/constant.dart';
import 'package:spotrootweb/controlls/locationController.dart';
import 'package:spotrootweb/controlls/mutationController.dart';
import 'package:spotrootweb/view/GoogleMapScreen.dart';

class AddLocation extends StatelessWidget {
  const AddLocation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocationController>(
        init: LocationController(),
        builder: (loc) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Constant.textWithStyle(
                text: 'Add a spot',
                color: Constant.textPrimary,
                size: 15.sp,
                maxLine: 5,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                height: 1.h,
              ),
              Constant.textWithStyle(
                //  text: 'Add effectevely will helps to reach more clicks.',
                text:
                    'Try to get people there!. we should know the location of the spot you found.',
                color: Constant.textSecondary,
                size: 12.sp,
                maxLine: 5,
                fontWeight: FontWeight.normal,
              ),
              SizedBox(
                height: 3.h,
              ),
              if (loc.currentAddress != '')
                Row(
                  children: [
                    Image.asset(
                      'lib/constant/icons/pin.png',
                      color: Constant.bgRed,
                      scale: 18,
                    ),
                    Expanded(
                      child: Constant.textWithStyle(
                          text: loc.currentAddress,
                          maxLine: 10,
                          fontWeight: FontWeight.normal,
                          size: 12.sp,
                          color: Constant.bgRed),
                    ),
                  ],
                ),
                SizedBox(
                height: 3.h,
              ),
              SizedBox(
                height: 8.h,
                width: 30.w,
                child: ElevatedButton.icon(
                  onPressed: () async {
                    Get.to(() => const GoogleMapScreen());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Constant.bgGreen,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  icon: loc.fetchingLocation
                      ? const SizedBox()
                      : Transform.rotate(
                          angle: -5.5,
                          child: const Icon(
                            Icons.navigation_rounded,
                            color: Constant.bgWhite,
                          )),
                  label: loc.fetchingLocation
                      ? SizedBox(
                          height: 8.h,
                          width: 100.w,
                          child: const MutationLoader())
                      : Constant.textWithStyle(
                          text: 'Select location',
                          color: Constant.bgWhite,
                          fontWeight: FontWeight.normal,
                          size: 12.sp,
                        ),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
            ],
          );
        });
  }
}
