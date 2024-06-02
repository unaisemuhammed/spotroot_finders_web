// ignore_for_file: file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotrootweb/constant/constant.dart';
import 'package:spotrootweb/controlls/AddPlace/addPlaceController.dart';
import 'package:spotrootweb/controlls/locationController.dart';
import 'package:spotrootweb/widgets/addplace.dart/OtherInformation.dart';
import 'package:spotrootweb/widgets/addplace.dart/addimages.dart';
import 'package:spotrootweb/widgets/addplace.dart/entryDetails.dart';
import 'package:spotrootweb/widgets/addplace.dart/location.dart';
import 'package:spotrootweb/widgets/addplace.dart/placeAndLandMark.dart';
import 'package:spotrootweb/widgets/addplace.dart/uploadSpot.dart';

class AddAPlaceScreen extends StatelessWidget {
  const AddAPlaceScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(LocationController());
    PageController controller =
        PageController(viewportFraction: 1, keepPage: true);

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: GetBuilder<AddPlaceController>(
          init: AddPlaceController(),
          builder: (addPlaceController) {
            return Scaffold(
              backgroundColor: Constant.bgGreen,
              body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: SingleChildScrollView(
                    child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 50),
                        child: Container(
                          padding: const EdgeInsets.all(30),
                          width: 70.w,
                          decoration: BoxDecoration(
                              color: Constant.bgSecondary,
                              borderRadius: BorderRadius.circular(30)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const AddLocation(),
                              SizedBox(
                                height: 5.h,
                              ),
                              PlaceAndLAndMark(
                                  placeNameController:
                                      addPlaceController.placeNameController,
                                  descController:
                                      addPlaceController.descController,
                                  landMarkController:
                                      addPlaceController.landMarkController),
                              SizedBox(
                                height: 5.h,
                              ),
                              EntryDetails(
                                entryTimeController:
                                    addPlaceController.entranceTimeController,
                                costController:
                                    addPlaceController.costController,
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
                              const AddImages(),
                              SizedBox(
                                height: 5.h,
                              ),
                              const LocationSummary()
                            ],
                          ),
                        ),
                      ),
                    ),
                  )),
            );
          }),
    );
  }
}
