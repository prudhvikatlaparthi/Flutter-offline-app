import 'package:floor/floor.dart';
import 'package:offline_app/db/dao/customer_dao.dart';
import 'package:offline_app/db/dao/vehicle_dao.dart';

import 'app_database/app_database.dart';
import 'migration_scripts/migrations1_2.dart';
import 'migration_scripts/migrations2_3.dart';

class DBOperations {
  static AppDatabase? _database;
  static DBOperations? _dbOperations;

  DBOperations._createInstance();

  factory DBOperations() {
    if(_dbOperations == null){
      _dbOperations = DBOperations._createInstance();
      return _dbOperations!;
    } else {
      return _dbOperations!;
    }
  }

  Future<AppDatabase> get database async {
    if(_database == null){
      _database = await initializeDatabase();
      return _database!;
    } else {
      return _database!;
    }
  }

  Future<AppDatabase> initializeDatabase() async {
    final database = await $FloorAppDatabase
        .databaseBuilder('offline_database.db')
        .addMigrations([migration1to2,migration2to3])
        .build();
    return database;
  }

  Future<CustomerDao> getCustomerDao() async {
    AppDatabase appDatabase = await database;
    final customerDao = appDatabase.customerDao;
    return customerDao;
  }

  Future<VehicleDao> getVehicleDao() async {
    AppDatabase appDatabase = await database;
    final vehicleDao = appDatabase.vehicleDao;
    return vehicleDao;
  }
}
