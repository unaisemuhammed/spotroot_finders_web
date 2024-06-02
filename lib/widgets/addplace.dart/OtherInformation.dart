// ignore: file_names
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotrootweb/constant/constant.dart';

class OtherInformation extends StatelessWidget {
   final TextEditingController whatHaveController;
  final TextEditingController bestTimeController;
  const OtherInformation({
    super.key,
    required this.whatHaveController,
      required this.bestTimeController
  });

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
        getThefields(hintText: 'What have there', maxLine: 100, height: 20,controller: whatHaveController),
         SizedBox(
          height: .5.h,
        ),
        Constant.textWithStyle(
          text:
              'Please explain why the place is attractive?. What to see there?.',
          color: Constant.bgRed.withOpacity(.7),
          size: 12.sp,
          maxLine: 5,
          fontWeight: FontWeight.normal,
        ),
        
        SizedBox(
          height: 1.h,
        ),
        getThefields(hintText: 'Best time to visit', maxLine: 100, height: 20,controller: bestTimeController),
        SizedBox(
          height: .5.h,
        ),
        Constant.textWithStyle(
          text:
              'Describe What is the best time to visit there?.',
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
      {required String hintText, required int maxLine, required int height, required TextEditingController controller}) {
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
