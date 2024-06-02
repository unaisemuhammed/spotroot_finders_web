import 'package:flutter/gestures.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotrootweb/constant/constant.dart';
import 'package:spotrootweb/controlls/mutationController.dart';
import 'package:spotrootweb/controlls/userStateController.dart';
import 'package:url_launcher/url_launcher.dart';

class MobileNumber extends StatelessWidget {
  final UserStateController userStateController;
  final bool isRegister;
  final TextEditingController phoneNumberController;

  const MobileNumber({
    super.key,
    this.isRegister = false,
    required this.userStateController,
    required this.phoneNumberController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 6.h,
          width: 100.w,
          decoration: BoxDecoration(
              color: Constant.bgSecondary,
              // border: Border.all(color: Constant.bgGreen, width: 1),
              borderRadius: BorderRadius.circular(10)),
          child: TextFormField(
            controller: phoneNumberController,
            cursorColor: Constant.textPrimary,
            maxLines: 1,
            textAlign: TextAlign.left,
            textAlignVertical: TextAlignVertical.center,
            keyboardType: const TextInputType.numberWithOptions(),
            decoration: InputDecoration(
                counterText: '',
                prefixIcon: const Icon(
                  Icons.phone_iphone,
                  color: Constant.textSecondary,
                ),
                border: InputBorder.none,
                hintText: 'Mobile Number',
                hintStyle: GoogleFonts.unbounded(
                    color: Constant.textSecondary.withOpacity(.5),
                    fontSize: 15.sp,
                    letterSpacing: 2,
                    fontWeight: FontWeight.normal)),
            style: GoogleFonts.unbounded(
                color: Constant.textPrimary,
                fontSize: 15.sp,
                letterSpacing: 2,
                fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(
          height: 1.h,
        ),
        SizedBox(
          height: 5.h,
          width: 100.w,
          child: GetBuilder<MutationControlls>(
              init: MutationControlls(),
              builder: (mutationController) {
                if (userStateController.verificationId != null &&
                    mutationController.status == MutationStatus.loading) {
                  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                    mutationController.status = MutationStatus.done;
                  });
                }
                if (userStateController.mobileVerificationError != null) {
                  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                    mutationController.status = MutationStatus.done;
                  });
                }

                return ElevatedButton(
                  onPressed: () async {
                    if (phoneNumberController.text.isNotEmpty &&
                        phoneNumberController.text.isNumericOnly &&
                        phoneNumberController.text.length > 9) {
                      userStateController.clearError();
                      mutationController.status = MutationStatus.loading;
                      await userStateController
                          .verifyPhoneNumber(phoneNumberController.value.text);

                      if (kDebugMode) {
                        (phoneNumberController.value.text);
                      }
                    } else {
                      userStateController.mobileVerificationError =
                          'Please enter a valid phone number.';
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        isRegister ? Constant.bgGreen : Constant.bgGreen,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: mutationController.status == MutationStatus.loading
                      ? const MutationLoader()
                      : Constant.textWithStyle(
                          text: 'COUNTINUE',
                          color: Constant.bgWhite,
                          fontWeight: FontWeight.w500,
                          size: 14.sp,
                        ),
                );
              }),
        ),
        SizedBox(height: 3.h,),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text:
                    'By Creating or logging into an account you are agreeing with our',
                style: GoogleFonts.unbounded(
                  color: Constant.textSecondary,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.normal,
                ),
              ),
              TextSpan(
                  text: ' Terms and Conditions',
                  style: GoogleFonts.unbounded(
                    color: Constant.bgBlue,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.normal,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () async {
                      launchUrl(
                          Uri.parse("https://www.termsfeed.com/live/735123db-4769-4f54-8f1d-8303933ea329"));
                    }),
              TextSpan(
                text: ' and',
                style: GoogleFonts.unbounded(
                  color: Constant.textSecondary,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.normal,
                ),
              ),
              TextSpan(
                  text: ' Privacy Policy.',
                  style: GoogleFonts.unbounded(
                    color: Constant.bgBlue,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.normal,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () async {
                      launchUrl(
                          Uri.parse("https://www.termsfeed.com/live/735123db-4769-4f54-8f1d-8303933ea329"));
                    }),
            ],
          ),
        ),
      ],
    );
  }
}
