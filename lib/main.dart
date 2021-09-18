import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:offline_app/db/db_operations.dart';
import 'package:offline_app/ui/home/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDB();
  runApp(const MyApp());
}

Future<void> initializeDB() async {
  await DBOperations().database;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}
