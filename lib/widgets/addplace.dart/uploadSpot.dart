// ignore: file_names
import 'dart:io';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotrootweb/constant/constant.dart';
import 'package:spotrootweb/controlls/AddPlace/addPlaceController.dart';
import 'package:spotrootweb/controlls/PickMediaController.dart';
import 'package:spotrootweb/controlls/locationController.dart';
import 'package:spotrootweb/controlls/mutationController.dart';
import 'package:spotrootweb/controlls/spotRepository.dart';
import 'package:spotrootweb/controlls/userStateController.dart';
import 'package:spotrootweb/model/postModel.dart';
import 'package:spotrootweb/widgets/utilis.dart';

class LocationSummary extends StatelessWidget {
  const LocationSummary({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    LocationController locationController = Get.put(LocationController());
    ImagePickerController imagePickerController =
        Get.put(ImagePickerController());
    AddSpotRepository userRepository = Get.put(AddSpotRepository());
    UserStateController userState = Get.put(UserStateController());

    return GetBuilder<AddPlaceController>(
        init: AddPlaceController(),
        builder: (addPlaceController) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      if (addPlaceController.checkOne) {
                        addPlaceController.checkOne = false;
                      } else {
                        addPlaceController.checkOne = true;
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(1),
                      decoration: BoxDecoration(
                          color: addPlaceController.checkOne
                              ? Constant.bgGreen
                              : Colors.transparent,
                          border: Border.all(
                            color: Constant.bgGreen,
                          ),
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: Icon(
                          Icons.check,
                          color: Constant.bgPrimary,
                          size: 20.sp,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 1.w,
                  ),
                  Expanded(
                    child: Constant.textWithStyle(
                      text:
                          'Make Sure You are provided all the details about this spot. it will helps to earn more.',
                      color: Constant.bgRed,
                      size: 14.sp,
                      maxLine: 5,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 1.h,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () async {
                      if (addPlaceController.checkTwo) {
                        addPlaceController.checkTwo = false;
                      } else {
                        addPlaceController.checkTwo = true;
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(1),
                      decoration: BoxDecoration(
                          color: addPlaceController.checkTwo
                              ? Constant.bgGreen
                              : Colors.transparent,
                          border: Border.all(
                            color: Constant.bgGreen,
                          ),
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: Icon(
                          Icons.check,
                          color: Constant.bgPrimary,
                          size: 20.sp,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 1.w,
                  ),
                  Expanded(
                    child: Constant.textWithStyle(
                      text: 'Make Sure provided details are correct.',
                      color: Constant.bgRed,
                      size: 14.sp,
                      maxLine: 5,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              if (addPlaceController.checkOne && addPlaceController.checkTwo)
                SizedBox(
                  height: 8.h,
                  width: 80.w,
                  child: ElevatedButton(
                    onPressed: () async {
                      addPlaceController.isUploading = true;
                      String formattedDate = DateTime.now().toString();
                      if (addPlaceController.placeNameController.text != '') {
                        final user = PostModel(
                            // latLng:
                            //     '${locationController.latLng!.latitude},${locationController.latLng!.longitude}',
                             latLng:
                                '${userState.currentUser?.displayName}',
                            placeName:
                                addPlaceController.placeNameController.text,
                            descName: addPlaceController.descController.text,
                            landMark:
                                addPlaceController.landMarkController.text,
                            entranceTime:
                                addPlaceController.entranceTimeController.text,
                            visitCost: addPlaceController.costController.text,
                            whatHave:
                                addPlaceController.whatHaveController.text,
                            bestTime:
                                addPlaceController.bestTimeController.text,
                            spotImage: '',
                            addedDate: formattedDate);
                        await userRepository.createPost(
                            postModel: user, id: userState.currentUser!.uid);
                        addPlaceController.isUploading = false;
                      } else {
                        Utilis.snackBar(
                            title: 'Oops',
                            message:
                                'Please check you are provided all details.');
                      }
                      addPlaceController.isUploading = false;
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Constant.bgGreen,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: addPlaceController.isUploading
                        ? const MutationLoader()
                        : Constant.textWithStyle(
                            text: 'Upload Spot',
                            color: Constant.bgWhite,
                            fontWeight: FontWeight.normal,
                            size: 14.sp,
                          ),
                  ),
                )
              else
                SizedBox(
                  height: 8.h,
                  width: 80.w,
                  child: ElevatedButton(
                    onPressed: () async {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Constant.bgGreen.withOpacity(.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Constant.textWithStyle(
                      text: 'Upload Spot',
                      color: Constant.bgWhite.withOpacity(.5),
                      fontWeight: FontWeight.normal,
                      size: 14.sp,
                    ),
                  ),
                ),
              SizedBox(
                height: 10.h,
              ),
            ],
          );
        });
  }
}
