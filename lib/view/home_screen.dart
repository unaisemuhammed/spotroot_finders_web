import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotrootweb/constant/constant.dart';
import 'package:spotrootweb/view/AuthScreens/loginScreen.dart';
import 'package:spotrootweb/view/addAPlace.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.bgPrimary,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        color: Constant.bgGreen,
        width: 100.w,
        height: 100.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Spot',
                  style: GoogleFonts.anton(
                      color: Constant.bgWhite,
                      fontWeight: FontWeight.bold,
                      fontSize: 32.sp,
                      letterSpacing: 2),
                ),
                Text(
                  'Root',
                  style: GoogleFonts.anton(
                      color: const Color(0xFFFFDE59),
                      fontWeight: FontWeight.bold,
                      fontSize: 32.sp,
                      letterSpacing: 2),
                ),
              ],
            ),
            SizedBox(
              height: .5..h,
            ),
            Text(
              //   'Won\'t Let You Miss a Single Spot',
              'A Spot Finders Application',
              style: GoogleFonts.anton(
                  color: Constant.bgWhite,
                  fontWeight: FontWeight.normal,
                  fontSize: 15.sp,
                  letterSpacing: 1),
            ),
            SizedBox(
              height: 2.h,
            ),
            InkWell(
              onTap: () => Get.to(() => const LoginScreen()),
              child: Container(
                width: 30.w,
                height: 8.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Constant.bgWhite,)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Constant.textWithStyle(
                        text: 'Add a Spot',
                        size: 14.sp,
                        maxLine: 3,
                        fontWeight: FontWeight.w500,
                        color: Constant.bgWhite),
                        const Icon(Icons.arrow_forward,color: Constant.bgWhite,)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
