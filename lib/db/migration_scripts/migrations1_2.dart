import 'package:floor/floor.dart';

final qList = [
  '''CREATE TABLE IF NOT EXISTS Vehicle (vehicleId TEXT NOT NULL, vehno TEXT NOT NULL, webVehicleId INTEGER NOT NULL, 
  isSync INTEGER NOT NULL, updatedDT INTEGER NOT NULL, customerId TEXT NOT NULL, FOREIGN KEY (customerId) REFERENCES Customer (customerId) ON UPDATE NO ACTION ON DELETE NO ACTION, PRIMARY KEY (vehicleId))'''
];

final migration1to2 = Migration(1, 2, (database) async {
  await Future.forEach(qList, (String item) async {
    await database.execute(item);
  });
});
