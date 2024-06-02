import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:spotrootweb/constant/constant.dart';

class MutationControlls extends GetxController {
  late MutationStatus _status = MutationStatus.initial;

  MutationStatus get status => _status;

  set status(MutationStatus value) {
    _status = value;
    update();
  }
}

class MutationLoader extends StatelessWidget {
  const MutationLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CupertinoActivityIndicator(
        color: Constant.bgBlue,
        radius: 10,
      ),
    );
  }
}

enum MutationStatus { initial, loading, done, error }
