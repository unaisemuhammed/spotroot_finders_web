
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
  final UserStateController userStateController;
    final bool isEdit;

  const SignUpForm(
      {super.key,
      required this.fullNameController,
      required this.userNameController,
      required this.userStateController,
      required this.isEdit
      });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      
     
        Container(
          height: 6.h,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          width: 100.w,
          decoration: BoxDecoration(
              color: Constant.bgSecondary,
              // border: Border.all(color: Constant.bgGreen, width: 1),
              borderRadius: BorderRadius.circular(10)),
          child: TextFormField(
            controller: userNameController,
            cursorColor: Constant.textPrimary,
            maxLines: 1,
            textAlign: TextAlign.left,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
                counterText: '',
                border: InputBorder.none,
                hintText: 'User name',
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
        ),  Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          height: 6.h,
          width: 100.w,
          decoration: BoxDecoration(
              color: Constant.bgSecondary,
              // border: Border.all(color: Constant.bgGreen, width: 1),
              borderRadius: BorderRadius.circular(10)),
          child: TextFormField(
            controller: fullNameController,
            cursorColor: Constant.textPrimary,
            maxLines: 1,
            textAlign: TextAlign.left,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
                counterText: '',
                border: InputBorder.none,
                hintText: 'Full name',
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
        if(isEdit)
        Constant.textWithStyle(
          text: 'Name or Username should be different from current value.',
          color: Constant.textSecondary,
          size: 14.sp,
          maxLine: 5,
          fontWeight: FontWeight.normal,
        ),
        SizedBox(
          height: 1.h,
        ),
        SizedBox(
          height: 5.h,
          width: 100.w,
          child: ElevatedButton(
            onPressed: () async {
              if (userNameController.text.isNotEmpty &&
                  fullNameController.text.isNotEmpty) {
                if (fullNameController.text.length > 2 &&
                    userNameController.text.length > 2) {
                  userStateController.isLoading = true;
                  await userStateController.currentUser?.updateDisplayName(
                      '${fullNameController.text},${userNameController.text}');
                  userStateController.isLoading = false;
                  userStateController.subscribeToAuthChanges();
                } else {
                  Utilis.snackBar(
                      title: 'Sorry!',
                      message: 'Please enter a valid name and username.');
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
            child: userStateController.isLoading?const MutationLoader():Constant.textWithStyle(
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
}
