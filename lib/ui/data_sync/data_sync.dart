import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:offline_app/preference/data_preference.dart';
import 'package:offline_app/service/timer_controller.dart';
import 'package:offline_app/sync/controller/sync_controller.dart';
import 'package:offline_app/ui/home/home.dart';

class DataSync extends StatelessWidget {
  const DataSync({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Welcome\nClick to start the sync.',textAlign: TextAlign.center,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: OutlinedButton(
                  onPressed: () {
                    Get.find<SyncController>().startSync(
                        isSilent: false,
                        finishCallback: () {
                          Get.find<DataPreferences>().setIsAppLaunched(true);
                          Get.find<TimerController>().startTimer();
                          Get.off(() => const Home());
                        });
                  },
                  child: const Text(
                    'Save',
                    style: TextStyle(fontSize: 20),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
