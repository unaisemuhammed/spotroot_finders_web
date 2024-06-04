import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotrootweb/constant/constant.dart';
import 'package:spotrootweb/controlls/mutationController.dart';
import 'package:spotrootweb/controlls/userStateController.dart';
import 'package:spotrootweb/widgets/utilis.dart';

class SignUpForm extends StatelessWidget {
  final TextEditingController fullNameController;
  final TextEditingController userNameController;
  final TextEditingController placeNameController;

  final UserStateController userStateController;
  final bool isEdit;

  const SignUpForm(
      {super.key,
      required this.fullNameController,
      required this.userNameController,
      required this.placeNameController,
      required this.userStateController,
      required this.isEdit});

  @override
  Widget build(BuildContext context) {
    DatabaseReference _testRef = FirebaseDatabase.instance.ref();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        getThefields(
            hintText: 'Instagram Username', controller: userNameController),
        SizedBox(
          height: .5.h,
        ),
        Constant.textWithStyle(
          text:
              'Provide your instagram username, It may helps to get more reach.',
          color: Constant.bgRed.withOpacity(.6),
          size: 14.sp,
          maxLine: 5,
          fontWeight: FontWeight.normal,
        ),
        SizedBox(
          height: 1.h,
        ),
        getThefields(hintText: 'Full name', controller: fullNameController),
        SizedBox(
          height: 1.h,
        ),
        getThefields(hintText: 'Place name', controller: placeNameController),
        SizedBox(
          height: 1.h,
        ),
        SizedBox(
          height: .5.h,
        ),
        if (isEdit)
          Constant.textWithStyle(
            text: 'Giving data should be different from existing value.',
            color: Constant.textSecondary,
            size: 14.sp,
            maxLine: 5,
            fontWeight: FontWeight.normal,
          ),
        SizedBox(
          height: 2.h,
        ),
        SizedBox(
          height: 6.h,
          width: 100.w,
          child: ElevatedButton(
            onPressed: () async {
              if (userNameController.text.isNotEmpty &&
                  fullNameController.text.isNotEmpty &&
                  placeNameController.text.isNotEmpty) {
                if (fullNameController.text.length > 2 &&
                    userNameController.text.length > 2 &&
                    placeNameController.text.length > 2) {
                  userStateController.isLoading = true;
                  await userStateController.currentUser?.updateDisplayName(
                      '${fullNameController.text}|${userNameController.text}|${placeNameController.text}');
                  _testRef.child('${userStateController.currentUser?.uid}').set(
                      '${fullNameController.text}|${userNameController.text}|${placeNameController.text}');
                  userStateController.isLoading = false;
                  userStateController.subscribeToAuthChanges();
                } else {
                  Utilis.snackBar(
                      title: 'Sorry!',
                      message: 'Please provide a valid details.');
                }
              } else {
                Utilis.snackBar(
                    title: 'Oops', message: 'Please fill the form to go head.');
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Constant.bgGreen,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: userStateController.isLoading
                ? const MutationLoader()
                : Constant.textWithStyle(
                    text: 'COUNTINUE',
                    color: Constant.bgWhite,
                    fontWeight: FontWeight.w500,
                    size: 14.sp,
                  ),
          ),
        ),
      ],
    );
  }

  getThefields(
      {required String hintText, required TextEditingController controller}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      height: 6.h,
      width: 100.w,
      decoration: BoxDecoration(
          color: Constant.bgPrimary,
          // border: Border.all(color: Constant.bgGreen, width: 1),
          borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
        controller: controller,
        cursorColor: Constant.textPrimary,
        maxLines: 1,
        textAlign: TextAlign.left,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
            counterText: '',
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
