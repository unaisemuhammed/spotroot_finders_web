// ignore: file_names
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotrootweb/constant/constant.dart';
import 'package:spotrootweb/controlls/PickMediaController.dart';

class AddImages extends StatelessWidget {
  const AddImages({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Constant.textWithStyle(
          text: 'Add Spot Images',
          color: Constant.textPrimary,
          size: 15.sp,
          maxLine: 5,
          fontWeight: FontWeight.bold,
        ),
        SizedBox(
          height: 1.h,
        ),
        Constant.textWithStyle(
          text: 'Add effectevely will helps to reach more clicks.',
          color: Constant.textSecondary,
          size: 12.sp,
          maxLine: 5,
          fontWeight: FontWeight.normal,
        ),
        SizedBox(
          height: 3.h,
        ),
        InkWell(
          onTap: () async {
            ImagePickerController imgController =
                Get.put(ImagePickerController());

            final file =
                await imgController.pickImage(source: ImageSource.gallery);
            if (file != null) {
              final croppedfile = await imgController.crop(
                  aspctRatio: CropAspectRatioPreset.original,
                  cropStyle: CropStyle.rectangle,
                  file: file);
              imgController.selectedImage = File(croppedfile!.path);
              imgController.selectedMediaList.add(imgController.selectedImage);
            }
          },
          child: Container(
            height: 8.w,
            width: 8.w,
            decoration: BoxDecoration(
                border: Border.all(color: Constant.textSecondary),
                borderRadius: BorderRadius.circular(20)),
            child: const Center(
              child: Icon(Icons.add),
            ),
          ),
        ),
        SizedBox(
          height: 1.h,
        ),
        Constant.textWithStyle(
          text:
              'Now we have only an option to upload a single photo. Next version you can upload multiple photo and videos.',
          color: Constant.bgRed.withOpacity(.7),
          size: 12.sp,
          maxLine: 5,
          fontWeight: FontWeight.normal,
        ),
        SizedBox(
          height: 3.h,
        ),
        GetBuilder<ImagePickerController>(
            init: ImagePickerController(),
            builder: (imgPicker) {
              if (imgPicker.selectedMediaList.isEmpty) {
                return const SizedBox();
              } else {
                return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.only(
                        top: 0, bottom: 30, right: 10, left: 10),
                    //itemCount: imgPicker.selectedMediaList.length,
                    itemCount: 1,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 1.w,
                        crossAxisSpacing: 1.w,
                        crossAxisCount: 2,
                        mainAxisExtent: 20.h),
                    itemBuilder: (BuildContext context, int index) {
                      return ClipRRect(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Constant.bgGreen,
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: FileImage(
                                      imgPicker.selectedMediaList.last),
                                  fit: BoxFit.cover)),
                        ),
                      );
                    });
              }
            }),
      ],
    );
  }
}
