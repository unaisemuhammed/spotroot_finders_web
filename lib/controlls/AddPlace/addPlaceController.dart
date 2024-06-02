import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPlaceController extends GetxController {
  final placeNameController = TextEditingController();
  final descController = TextEditingController();
  final landMarkController = TextEditingController();
  final entranceTimeController = TextEditingController();
  final costController = TextEditingController();
  final whatHaveController = TextEditingController();
  final bestTimeController = TextEditingController();
  bool _isEnd = false;
  bool _isFirst = true;
  bool _checkOne = false;
  bool _checkTwo = false;
  bool _isUploading = false;

  @override
  void onClose() {
    placeNameController.dispose();
    landMarkController.dispose();
    entranceTimeController.dispose();
    costController.dispose();
    whatHaveController.dispose();
    bestTimeController.dispose();
    super.onClose();
  }

  bool get isFirst => _isFirst;
  set isFirst(bool v) {
    _isFirst = v;
    update();
  }

  bool get isEnd => _isEnd;
  set isEnd(bool v) {
    _isEnd = v;
    update();
  }

  bool get checkOne => _checkOne;
  set checkOne(bool v) {
    _checkOne = v;
    update();
  }

  bool get checkTwo => _checkTwo;
  set checkTwo(bool v) {
    _checkTwo = v;
    update();
  }

   bool get isUploading => _isUploading;
  set isUploading(bool v) {
    _isUploading = v;
    update();
  }
}
