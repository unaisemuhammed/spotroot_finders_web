// ignore: file_names
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotrootweb/constant/constant.dart';

class PlaceAndLAndMark extends StatelessWidget {
  final TextEditingController landMarkController;
  final TextEditingController placeNameController;
    final TextEditingController descController;

  const PlaceAndLAndMark(
      {super.key,
      required this.placeNameController,
      required this.landMarkController,required this.descController});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Constant.textWithStyle(
          text: 'Brief the spot',
          color: Constant.textPrimary,
          size: 15.sp,
          maxLine: 5,
          fontWeight: FontWeight.bold,
        ),
        SizedBox(
          height: 1.h,
        ),
        Constant.textWithStyle(
          text: 'Add effectevely will helps to reach more clicks.',
          color: Constant.textSecondary,
          size: 12.sp,
          maxLine: 5,
          fontWeight: FontWeight.normal,
        ),
        SizedBox(
          height: 3.h,
        ),
        getThefields(
            hintText: 'Place name',
            maxLine: 1,
            height: 6,
            controller: placeNameController),
                  SizedBox(
          height: 1.h,
        ),
        getThefields(
            hintText: 'Short description about this place',
            maxLine: 50,
            height: 20,
            controller: descController),
        SizedBox(
          height: 1.h,
        ),
        getThefields(
            hintText: 'Land Mark',
            maxLine: 50,
            height: 20,
            controller: landMarkController),
        SizedBox(
          height: .5.h,
        ),
        Constant.textWithStyle(
          text:
              'Please write a root map to the spot helps people get there if anyone get stuck. Written root map helps to find spot in out of network coverage area.',
          color: Constant.bgRed.withOpacity(.7),
          size: 12.sp,
          maxLine: 5,
          fontWeight: FontWeight.normal,
        ),
        SizedBox(
          height: .5.h,
        ),
        Constant.textWithStyle(
          text:
              'eg : The nearest metro station to Wonderla is the Kengeri Metro Station,'
              ' which is on the Purple Line. You can take a bus or taxi from the metro station to the park.'
              ' And the park is opposite side of the sundaran tea stall.',
          color: Constant.bgRed.withOpacity(.7),
          size: 12.sp,
          maxLine: 5,
          fontWeight: FontWeight.normal,
        ),
        SizedBox(
          height: 1.h,
        ),
      ],
    );
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
                fontSize: 12.sp,
                letterSpacing: 2,
                fontWeight: FontWeight.normal)),
        style: GoogleFonts.unbounded(
            color: Constant.textPrimary,
            fontSize: 12.sp,
            letterSpacing: 2,
            fontWeight: FontWeight.w500),
      ),
    );
  }
}
