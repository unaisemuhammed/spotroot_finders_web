
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotrootweb/constant/constant.dart';
import 'package:spotrootweb/controlls/mutationController.dart';
import 'package:spotrootweb/controlls/userStateController.dart';

class Otp extends StatelessWidget {
  final bool isRegister;
  final TextEditingController otpController;
  final UserStateController userStateController;
  const Otp({
    super.key,
    this.isRegister = false,
    required this.userStateController,
    required this.otpController,
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
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextFormField(
            controller: otpController,
            maxLength: 6,
            keyboardType: TextInputType.number,
            cursorColor: Constant.textPrimary,
            maxLines: 1,
            textAlign: TextAlign.center,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              counterText: '',
              border: InputBorder.none,
              hintText: 'Code here',
              hintStyle: GoogleFonts.unbounded(
                  color: Constant.textSecondary.withOpacity(.5),
                  fontSize: 15.sp,
                  letterSpacing: 2,
                  fontWeight: FontWeight.normal),
            ),
            style: GoogleFonts.unbounded(
                color: Constant.textPrimary,
                fontSize: 15.sp,
                letterSpacing: 5,
                fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(
          height: 1.h,
        ),
        SizedBox(
          height: 5.h,
          width: 100.w,
          child: ElevatedButton(
            onPressed: () async {
              if (otpController.text.isNotEmpty) {
                FocusManager.instance.primaryFocus?.unfocus();
                userStateController.isLoading = true;

                await userStateController.verifyOTP(otpController.value.text);
                userStateController.isLoading = false;

                if (userStateController.mobileVerificationError != null) {
                  otpController.clear();
                }
              } else {
                userStateController.mobileVerificationError =
                    'Please enter a valid Otp';
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: isRegister ? Constant.bgGreen : Constant.bgGreen,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: userStateController.isLoading
                ? const MutationLoader()
                : Constant.textWithStyle(
                    text: 'LOGIN',
                    color: Constant.bgWhite,
                    fontWeight: FontWeight.w500,
                    size: 14.sp,
                  ),
          ),
        ),
      ],
    );
  }
}
