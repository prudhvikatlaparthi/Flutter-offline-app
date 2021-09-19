import 'dart:async';

import 'package:get/get.dart';
import 'package:offline_app/sync/controller/sync_controller.dart';

class TimerController extends GetxController {
  Timer? _timer;
  final _syncController = Get.find<SyncController>();

  startTimer() {
    _timer = Timer.periodic(const Duration(minutes: 1), (timer) {
      _syncController.startSync();
    });
  }

  cancelTimer() {
    _timer?.cancel();
  }

  @override
  void dispose() {
    cancelTimer();
    super.dispose();
  }
}
