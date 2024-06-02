// ignore_for_file: file_names

import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotrootweb/constant/constant.dart';
import 'package:spotrootweb/controlls/NavigationServce.dart';

class ImagePickerController extends GetxController {
  File? _selectedImage;
  List<File> selectedMediaList = [];
  final ImagePicker _imagePicker = ImagePicker();
  final ImageCropper _imageCropper = ImageCropper();

  Future<List<XFile>> pickMultipleMedia(
      {ImageSource source = ImageSource.gallery, int imageQuality = 100}) {
    return _imagePicker.pickMultiImage(imageQuality: imageQuality);
  }

  Future<XFile?> pickImage(
      {ImageSource source = ImageSource.gallery,
      int imageQuality = 100}) async {
    try {
      return await _imagePicker.pickImage(
          source: source, imageQuality: imageQuality);
    } catch (e) {
      if (source == ImageSource.gallery) {
        var status = await Permission.camera.status;
        if (status.isDenied) {
          getCupertinoDialog(
              title: 'Permission Denied', content: 'Allow access to library');
        } else {
          if (kDebugMode) {
            ('Exception occured!');
          }
        }
      } else {
        var status = await Permission.photos.status;
        if (status.isDenied) {
          getCupertinoDialog(
              title: 'Permission Denied', content: 'Allow access to camera');
        } else {
          if (kDebugMode) {
            ('Exception occured!');
          }
        }
      }
    }
    return null;
  }

  Future<XFile?> pickVideo({ImageSource source = ImageSource.gallery}) async {
    try {
      return await _imagePicker.pickVideo(
        source: source,
        maxDuration: const Duration(minutes: 10),
      );
    } catch (e) {
      if (source == ImageSource.gallery) {
        var status = await Permission.camera.status;
        if (status.isDenied) {
          getCupertinoDialog(
              title: 'Permission Denied', content: 'Allow access to library');
        } else {
          if (kDebugMode) {
            ('Exception occured!');
          }
        }
      } else {
        var status = await Permission.photos.status;
        if (status.isDenied) {
          getCupertinoDialog(
              title: 'Permission Denied', content: 'Allow access to camera');
        } else {
          if (kDebugMode) {
            ('Exception occured!');
          }
        }
      }
    }
    return null;
  }

  Future<CroppedFile?> crop(
      {required XFile file,
      required CropStyle cropStyle,
      required CropAspectRatioPreset aspctRatio}) async {
    return _imageCropper.cropImage(
      aspectRatioPresets: [aspctRatio],
      sourcePath: file.path,
      cropStyle: cropStyle,
      // compressQuality: 100,
    );
  }

  get selectedImage => _selectedImage;
  set selectedImage(val) {
    _selectedImage = val;
    update();
  }

//  List<File> get selectedMediaList => _selectedMediaList;
//   set selectedMediaList(val) {
//     _selectedMediaList .add(val);
//     update();
//   }

  getCupertinoDialog({required String title, required String content}) {
    showCupertinoDialog(
        barrierDismissible: true,
        context: NavigationService.navigatorKey.currentContext!,
        builder: (context) => CupertinoAlertDialog(
              title: Constant.textWithStyle(
                  text: title,
                  maxLine: 3,
                  size: 16.sp,
                  color: Constant.bgGreen,
                  fontWeight: FontWeight.w400),
              content: Constant.textWithStyle(
                  text: content,
                  maxLine: 3,
                  size: 14.sp,
                  color: Constant.bgGreen,
                  fontWeight: FontWeight.normal),
              actions: <Widget>[
                CupertinoDialogAction(
                  child: Constant.textWithStyle(
                      text: 'Cancel', size: 15.sp, color: Constant.bgGreen),
                  onPressed: () {
                    Get.back();
                  },
                ),
                CupertinoDialogAction(
                    child: Constant.textWithStyle(
                        text: 'Settings', size: 15.sp, color: Constant.bgGreen),
                    onPressed: () => openAppSettings()),
              ],
            ));
  }
}
