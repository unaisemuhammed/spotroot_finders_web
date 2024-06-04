import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:spotrootweb/controlls/Exceptions.dart';
import 'package:spotrootweb/services/firebaseAuthServices.dart';
import 'package:spotrootweb/view/AuthScreens/loginScreen.dart';
import 'package:spotrootweb/view/AuthScreens/signUpScreen.dart';
import 'package:spotrootweb/view/addAPlace.dart';
import 'package:spotrootweb/view/home_screen.dart';
import 'package:spotrootweb/widgets/utilis.dart';

class UserStateController extends GetxController {
  // final firebase.FirebaseAuth _auth = firebase.FirebaseAuth.instance;
  FirebaseAuthentication? firebaseAuth;

  int? resendToken;
  String? _mobileVerificationError;
  String? _verificationId;
  bool _isLoggedIn = false;
  bool _isLoading = false;
  String phoneNumber = '';
  String inlfuencerName = '';
  String inlfuencerprofilePic = '';
  User? currentUser;

  @override
  void onInit() {
   firebaseAuth = FirebaseAuthentication();
  //   subscribeToAuthChanges();
    super.onInit();
  }

 // bool get isSignedIn => _auth.currentUser != null;

  String? get mobileVerificationError => _mobileVerificationError;

  set mobileVerificationError(String? cause) {
    _mobileVerificationError = cause;
    if (_mobileVerificationError != null) {
      Utilis.snackBar(title: 'Oops!', message: '$cause');
    }
    update();
  }

  String? get verificationId => _verificationId;
  set verificationId(String? cause) {
    _verificationId = cause;
    update();
  }

  bool get isLoggedIn => _isLoggedIn;
  set isLoggedIn(bool flag) {
    _isLoggedIn = flag;
    update();
  }

  bool get isLoading => _isLoading;
  set isLoading(bool flag) {
    _isLoading = flag;
    update();
  }

  clearError() {
    mobileVerificationError = null;
  }

  //Phone number verifications methods and fields

  verifyPhoneNumber(String? phoneNumber) async {
    this.phoneNumber = phoneNumber!;
    int lengthPhoneNumber = phoneNumber.length;
    try {
      await FirebaseAuthentication.verifyPhoneNumber(
          lengthPhoneNumber == 10 ? '+91$phoneNumber' : phoneNumber,
          verifyPhoneNumberCallBack,
          verifyPhoneErrorCallback);
    } on UserException catch (e) {
      mobileVerificationError = e.cause;
    } catch (e) {
      mobileVerificationError =
          "Could not verify phone number, please try again later!";
    }
  }

  verifyPhoneNumberCallBack(String id, int? token) {
    verificationId = id;
    resendToken = token;
    update();
  }

  verifyPhoneErrorCallback(firebase.FirebaseAuthException e) {
    if (e.code == 'invalid-phone-number') {
      mobileVerificationError = 'The provided phone number is not valid.';
    } else {
      mobileVerificationError =
          'Error while verifying, Please try again later.';
    }
    update();
  }

  verifyOTP(String? otp) async {
    try {
      debugPrint('Verifying Otp:$otp');
      await FirebaseAuthentication.signInWithPhoneAuthCredential(
          verificationId, otp);
      subscribeToAuthChanges();
    } on UserException catch (e) {
      mobileVerificationError = e.cause;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      mobileVerificationError = "Could not verify OTP, please try again later!";
    }
  }

  subscribeToAuthChanges() async {
    currentUser = await FirebaseAuthentication.listenToAuthChange();
    if (currentUser == null) {
      debugPrint('User is not logged In');
      isLoggedIn = false;
     Get.offAll(() => const LoginScreen());
    } else {
      debugPrint('User is loggedIn : ${currentUser?.uid}');
      isLoggedIn = true;
      if (currentUser?.displayName == '' || currentUser?.displayName == null) {
       Get.offAll(() => const SignUpScreen());
      } else {
       Get.offAll(() => const AddAPlaceScreen());
      }
    }
    // ignore: unused_catch_clause
  }

  signOut() async {
    //logout
    debugPrint('LogoutCalled');
    verificationId = null;
    await FirebaseAuthentication.signOut();
    isLoggedIn = false;
    Get.offAll(() => const HomeScreen());
  }
}
