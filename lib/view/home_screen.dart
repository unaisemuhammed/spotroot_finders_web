import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotrootweb/constant/constant.dart';
import 'package:spotrootweb/controlls/userStateController.dart';
import 'package:spotrootweb/view/AuthScreens/loginScreen.dart';
import 'package:spotrootweb/view/addAPlace.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDesktop(BuildContext context) =>
        MediaQuery.of(context).size.width > 600;
    final Uri whatsApp = Uri.parse('https://wa.me/918590120729');
    final Uri instagram = Uri.parse(
        'https://www.instagram.com/spot.root?igsh=MW1oc24xZGo0NjM0aA%3D%3D&utm_source=qr');
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
                  fontSize: 20.sp,
                  letterSpacing: 1),
            ),
            SizedBox(
              height: 2.h,
            ),
            InkWell(
              onTap: () {
                Get.find<UserStateController>().subscribeToAuthChanges();
              },
              child: Container(
                width: 40.w,
                height: 8.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Constant.bgWhite,
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Constant.textWithStyle(
                        text: 'Add a Spot',
                        size: 16.sp,
                        maxLine: 3,
                        fontWeight: FontWeight.w500,
                        color: Constant.bgWhite),
                    const Icon(
                      Icons.arrow_forward,
                      color: Constant.bgWhite,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Constant.textWithStyle(
                        text: 'HelpCenter',
                        size: 14.sp,
                        maxLine: 3,
                        fontWeight: FontWeight.normal,
                        color: Constant.bgWhite), SizedBox(height: 2.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () => launchUrl(instagram),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          height: isDesktop(context) ? 3.w : 12.w,
                          width: isDesktop(context) ? 3.w : 12.w,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Constant.bgPrimary,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Image.asset(
                              'lib/constant/icons/instagram.png',
                              //     color: Constant.bgBlue,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      InkWell(
                        onTap: () => launchUrl(whatsApp),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          height: isDesktop(context) ? 3.w : 12.w,
                          width: isDesktop(context) ? 3.w : 12.w,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Constant.bgPrimary,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Image.asset(
                              'lib/constant/icons/whatsapp.png',
                              //     color: Constant.bgBlue,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 1.h,),
                    Constant.textWithStyle(
                        text: 'or call',
                        size: 14.sp,
                        maxLine: 3,
                        fontWeight: FontWeight.normal,
                        color: Constant.textSecondary),
                   Constant.textWithStyle(
                        text: '+91 8590120729',
                        size: 14.sp,
                        maxLine: 3,
                        fontWeight: FontWeight.normal,
                        color: Constant.textSecondary),
                ],
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
          ],
        ),
      ),
    );
  }
}
