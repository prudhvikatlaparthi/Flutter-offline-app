import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:offline_app/db/db_operations.dart';
import 'package:offline_app/ui/home/home.dart';

import 'preference/data_preference.dart';
import 'remote/dio_client.dart';
import 'repository/api_repository.dart';
import 'service/timer_controller.dart';
import 'sync/controller/sync_controller.dart';
import 'ui/data_sync/data_sync.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  Get.put(DataPreferences());
  Get.put(DioClient());
  Get.put(ApiRepository());
  Get.put(SyncController());
  Get.put(TimerController());
  await initializeDB();
  runApp(const MyApp());
}

Future<void> initializeDB() async {
  await DBOperations().database;
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final timerController = Get.find<TimerController>();
  final dataPref = Get.find<DataPreferences>();

  @override
  void initState() {
    if (dataPref.getIsAppLaunched()) {
      timerController.startTimer();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Offline App',
      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(Theme.of(context).textTheme),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: dataPref.getIsAppLaunched() ? const Home() : const DataSync(),
    );
  }
}
