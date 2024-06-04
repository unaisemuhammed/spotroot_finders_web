import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotrootweb/constant/constant.dart';
import 'package:spotrootweb/controlls/userStateController.dart';
import 'package:spotrootweb/widgets/authentication/mobileNumber.dart';
import 'package:spotrootweb/widgets/authentication/otp.dart';

class LoginScreen extends StatefulWidget {
  final bool isRegister;
  const LoginScreen({super.key, this.isRegister = false});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final phoneNumberController = TextEditingController();
  final otpController = TextEditingController();
  @override
  void dispose() {
    phoneNumberController.dispose();
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isDesktop(BuildContext context) =>
        MediaQuery.of(context).size.width > 600;

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: Constant.bgPrimary,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
        ),
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          child: GetBuilder<UserStateController>(
              init: UserStateController(),
              builder: (userStateController) {
                return Container(
                  height: 100.h,
                  width: 100.w,
                  color: Constant.bgPrimary,
                  child: SafeArea(
                    child: Padding(
                      padding: isDesktop(context)
                          ? EdgeInsets.symmetric(horizontal: 30.w)
                          : EdgeInsets.symmetric(horizontal: 5.w),
                      child: Container(
                        padding: const EdgeInsets.all(30),
                        width: 70.w,
                        decoration: BoxDecoration(
                            color: Constant.bgSecondary,
                            borderRadius: BorderRadius.circular(30)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            userStateController.verificationId == null
                                ? Constant.textWithStyle(
                                    text: 'Enter your mobile number',
                                    color: Constant.textPrimary,
                                    size: 20.sp,
                                    maxLine: 5,
                                    fontWeight: FontWeight.bold,
                                  )
                                : Constant.textWithStyle(
                                    text: 'Verification code',
                                    color: Constant.textPrimary,
                                    size: 20.sp,
                                    maxLine: 5,
                                    fontWeight: FontWeight.bold,
                                  ),
                            SizedBox(
                              height: 1.h,
                            ),
                            userStateController.verificationId == null
                                ? Constant.textWithStyle(
                                    text:
                                        'Please enter your mobile number here!',
                                    color: Constant.textSecondary,
                                    size: 14.sp,
                                    maxLine: 5,
                                    fontWeight: FontWeight.normal,
                                  )
                                : Constant.textWithStyle(
                                    text:
                                        'Please enter verification code sent to your number.',
                                    color: Constant.textSecondary,
                                    size: 14.sp,
                                    maxLine: 5,
                                    fontWeight: FontWeight.normal,
                                  ),
                            SizedBox(
                              height: 3.h,
                            ),
                            userStateController.verificationId == null
                                ? MobileNumber(
                                    phoneNumberController:
                                        phoneNumberController,
                                    userStateController: userStateController,
                                    isRegister: widget.isRegister,
                                  )
                                : Otp(
                                    isRegister: widget.isRegister,
                                    userStateController: userStateController,
                                    otpController: otpController,
                                  ),
                            SizedBox(
                              height: 1.h,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
