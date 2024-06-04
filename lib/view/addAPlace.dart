// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotrootweb/constant/constant.dart';
import 'package:spotrootweb/controlls/AddPlace/addPlaceController.dart';
import 'package:spotrootweb/controlls/locationController.dart';
import 'package:spotrootweb/controlls/userStateController.dart';
import 'package:spotrootweb/widgets/addplace.dart/OtherInformation.dart';
import 'package:spotrootweb/widgets/addplace.dart/entryDetails.dart';
import 'package:spotrootweb/widgets/addplace.dart/placeAndLandMark.dart';
import 'package:spotrootweb/widgets/addplace.dart/uploadSpot.dart';

class AddAPlaceScreen extends StatefulWidget {
  const AddAPlaceScreen({
    super.key,
  });

  @override
  State<AddAPlaceScreen> createState() => _AddAPlaceScreenState();
}

class _AddAPlaceScreenState extends State<AddAPlaceScreen> {
  final loc = Get.put(LocationController());

  @override
  void setState(VoidCallback fn) {
    loc.getCurrentPosition();
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    bool isDesktop(BuildContext context) =>
        MediaQuery.of(context).size.width > 600;

    Get.put(LocationController());

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: GetBuilder<AddPlaceController>(
          init: AddPlaceController(),
          builder: (addPlaceController) {
            return Scaffold(
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Constant.bgGreen,
                actions: [
                  // InkWell(
                  //   onTap: () => Get.find<UserStateController>().signOut(),
                  //   child: Padding(
                  //     padding:  EdgeInsets.symmetric(horizontal: 1.w),
                  //     child: Constant.textWithStyle(
                  //       text: 'Profile',
                  //       color: Constant.bgWhite,
                  //       size: 14.sp,
                  //       maxLine: 5,
                  //       fontWeight: FontWeight.normal,
                  //     ),
                  //   ),
                  // ),
                  InkWell(
                    onTap: () => Get.find<UserStateController>().signOut(),
                    child: Padding(
                      padding: EdgeInsets.only(right: 5.w, left: 1.w),
                      child: Constant.textWithStyle(
                        text: 'Logout',
                        color: Constant.bgWhite,
                        size: 14.sp,
                        maxLine: 5,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
              backgroundColor: Constant.bgGreen,
              body: SingleChildScrollView(
                child: Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: isDesktop(context)
                        ? EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h)
                        : EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                    child: Container(
                      padding: const EdgeInsets.all(30),
                      width: 100.w,
                      decoration: BoxDecoration(
                          color: Constant.bgSecondary,
                          borderRadius: BorderRadius.circular(30)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // const AddLocation(),
                          // SizedBox(
                          //   height: 5.h,
                          // ),
                          PlaceAndLAndMark(
                              placeNameController:
                                  addPlaceController.placeNameController,
                              descController: addPlaceController.descController,
                              landMarkController:
                                  addPlaceController.landMarkController),
                          SizedBox(
                            height: 5.h,
                          ),
                          EntryDetails(
                            entryTimeController:
                                addPlaceController.entranceTimeController,
                            costController: addPlaceController.costController,
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          OtherInformation(
                            whatHaveController:
                                addPlaceController.whatHaveController,
                            bestTimeController:
                                addPlaceController.bestTimeController,
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          // const AddImages(),
                          // SizedBox(
                          //   height: 5.h,
                          // ),
                          const LocationSummary()
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
