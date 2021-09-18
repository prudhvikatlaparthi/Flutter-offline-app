import 'dart:async';
import 'package:floor/floor.dart';
import 'package:offline_app/db/dao/customer_dao.dart';
import 'package:offline_app/db/dao/vehicle_dao.dart';
import 'package:offline_app/db/entity/customer.dart';
import 'package:offline_app/db/entity/vehicle.dart';
import 'package:offline_app/db/type_converters/date_time_converter.dart';
import 'package:sqflite/sqflite.dart' as sqflite;


part 'app_database.g.dart'; // the generated code will be there
@TypeConverters([DateTimeConverter])
@Database(version: 3, entities: [Customer,Vehicle])
abstract class AppDatabase extends FloorDatabase {
  CustomerDao get customerDao;
  VehicleDao get vehicleDao;
}