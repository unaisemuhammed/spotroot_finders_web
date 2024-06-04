import 'package:get/get.dart';
import 'package:spotrootweb/controlls/userStateController.dart';
// import 'package:spotrootpartner/controllers/networkController.dart';
// import 'package:spotrootpartner/controllers/userStateController.dart';

serviceLocator() {
  Get.lazyPut(() => UserStateController(), fenix: true);
}
