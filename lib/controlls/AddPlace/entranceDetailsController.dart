import 'package:get/get.dart';

class EntryDetailsController extends GetxController {
  List timeList = ['Any Time',];
  String _selectedTime = 'Entrance time';

  String get selectedTime => _selectedTime;
  set selectedTime(v) {
    _selectedTime = v;
    update();
  }
}
