// ignore: file_names
import 'dart:ui';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotrootweb/constant/constant.dart';
import 'package:spotrootweb/controlls/AddPlace/entranceDetailsController.dart';

class EntryDetails extends StatelessWidget {
  final TextEditingController entryTimeController;
  final TextEditingController costController;
  const EntryDetails(
      {super.key,
      required this.entryTimeController,
      required this.costController});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EntryDetailsController>(
        init: EntryDetailsController(),
        builder: (entry) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Constant.textWithStyle(
                text: 'Entrance Details',
                color: Constant.textPrimary,
                size: 20.sp,
                maxLine: 5,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                height: 1.h,
              ),
              Constant.textWithStyle(
                text: 'Entrance Details helps people to manage things.',
                color: Constant.textSecondary,
                size: 14.sp,
                maxLine: 5,
                fontWeight: FontWeight.normal,
              ),
              SizedBox(
                height: 3.h,
              ),
              // InkWell(
              //   onTap: () => getSheet(heading: 'Selecte a Time',data: entry.timeList),
              //   child: Container(
              //     padding: const EdgeInsets.symmetric(horizontal: 15),
              //     height: 6.h,
              //     width: 100.w,
              //     decoration: BoxDecoration(
              //         color: Constant.bgSecondary,
              //         // border: Border.all(color: Constant.bgGreen, width: 1),
              //         borderRadius: BorderRadius.circular(10)),
              //     child: Align(
              //       alignment: Alignment.centerLeft,
              //       child: Constant.textWithStyle(
              //           text: entry.selectedTime,
              //           color: Constant.textSecondary.withOpacity(.5),
              //           size: 20.sp,
              //           fontSpacing: 2,
              //           fontWeight: FontWeight.normal),
              //     ),
              //   ),
              // ),
              getThefields(
                  hintText: 'Entrance time',
                  maxLine: 2,
                  height: 6,
                  controller: entryTimeController),
              SizedBox(
                height: .5.h,
              ),
              Constant.textWithStyle(
                text:
                    'Please explain why the place is attractive?. What to see there?.',
                color: Constant.bgRed.withOpacity(.7),
                size: 14.sp,
                maxLine: 5,
                fontWeight: FontWeight.normal,
              ),
              SizedBox(
                height: 1.h,
              ),
              getThefields(
                  hintText: 'Cost to visit this place',
                  maxLine: 50,
                  height: 15,
                  controller: costController),
              SizedBox(
                height: .5.h,
              ),
              Constant.textWithStyle(
                text: 'eg: Entrance fee, Additional accessories etc.',
                color: Constant.bgRed.withOpacity(.7),
                size: 14.sp,
                maxLine: 5,
                fontWeight: FontWeight.normal,
              ),
              SizedBox(
                height: 1.h,
              ),
            ],
          );
        });
  }

  getSheet({required String heading, required List data}) {
    return Get.bottomSheet(
        enableDrag: false,
        isDismissible: true,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        DraggableScrollableSheet(
            initialChildSize: 0.5,
            maxChildSize: .9,
            minChildSize: 0.5,
            builder: (BuildContext context, ScrollController scrollController) {
              return ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                  child: Container(
                    padding:
                        const EdgeInsets.only(top: 20, right: 20, left: 20),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        color: Constant.bgWhite),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Constant.textWithStyle(
                              text: heading,
                              size: 20.sp,
                              fontWeight: FontWeight.w500,
                              color: Constant.textPrimary,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: const Icon(
                                Icons.close,
                                color: Constant.textPrimary,
                              ),
                            )
                          ],
                        ),
                        Divider(
                          height: 30,
                          color: Constant.textSecondary.withOpacity(.5),
                          thickness: .3,
                        ),
                        Expanded(
                          child: ListView(
                              controller: scrollController,
                              children: List.generate(
                                data.length,
                                (index) => Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Constant.textWithStyle(
                                          text: data[index],
                                          color: Constant.textPrimary,
                                          size: 20.sp,
                                          fontWeight: FontWeight.normal),
                                    ],
                                  ),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }));
  }

  getThefields(
      {required String hintText,
      required int maxLine,
      required int height,
      required TextEditingController controller}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      height: height.h,
      width: 100.w,
      decoration: BoxDecoration(
          color: Constant.bgPrimary,
          // border: Border.all(color: Constant.bgGreen, width: 1),
          borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
        controller: controller,
        cursorColor: Constant.textPrimary,
        maxLines: maxLine,
        textAlign: TextAlign.left,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: GoogleFonts.unbounded(
                color: Constant.textSecondary.withOpacity(.5),
                fontSize: 14.sp,
                letterSpacing: 2,
                fontWeight: FontWeight.normal)),
        style: GoogleFonts.unbounded(
            color: Constant.textPrimary,
            fontSize: 14.sp,
            letterSpacing: 2,
            fontWeight: FontWeight.w500),
      ),
    );
  }
}
