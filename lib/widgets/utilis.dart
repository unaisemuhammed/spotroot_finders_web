import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotrootweb/constant/constant.dart';

class Utilis {
  static showAlertDialog(
      {required BuildContext context,
      required String title,
      required String description}) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Constant.textWithStyle(
          textAlign: TextAlign.center,
          text: 'Ok',
          size: 17.sp,
          color: Constant.bgGreen),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      title: Constant.textWithStyle(
          textAlign: TextAlign.center,
          text: title,
          size: 16.sp,
          fontWeight: FontWeight.w500,
          color: Constant.textPrimary),
      content: Constant.textWithStyle(
          text: description,
          size: 14.sp,
          fontWeight: FontWeight.normal,
          maxLine: 5,
          textAlign: TextAlign.center,
          color: Constant.textSecondary),
      actions: [
        cancelButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static snackBar(
      {required String title, required String message, bool failure = true}) {
    Get.snackbar('', '',
        titleText: Constant.textWithStyle(
          text: title,
          size: 16.sp,
          fontWeight: FontWeight.w500,
          maxLine: 2,
          color: failure ? Constant.bgRed : Constant.bgGreen,
        ),
        messageText: Constant.textWithStyle(
          text: message,
          size: 14.sp,
          fontWeight: FontWeight.normal,
          maxLine: 3,
          color: Constant.textPrimary,
        ),
        animationDuration: const Duration(seconds: 1),
        backgroundColor: Constant.bgWhite.withOpacity(.5),
        barBlur: 5.0);
  }

  static Widget toastToExitApp = Container(
    width: 40.w,
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25.0),
      color: Constant.bgWhite,
    ),
    child: Center(
      child: Constant.textWithStyle(
        text: "Press again to exit",
        color: Constant.bgPrimary,
        size: 14.sp,
      ),
    ),
  );
}
