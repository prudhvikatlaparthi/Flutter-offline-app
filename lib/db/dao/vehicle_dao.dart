import 'package:floor/floor.dart';
import 'package:offline_app/db/entity/customer.dart';
import 'package:offline_app/db/entity/vehicle.dart';

@dao
abstract class VehicleDao {
  @Query('Select * from Vehicle')
  Future<List<Vehicle>> getAllCustomers();

  @Query('SELECT * FROM Vehicle WHERE vehicleId = :vehicleId')
  Future<Vehicle?> getVehicleByID(int vehicleId);

  @Query('SELECT * FROM Vehicle WHERE customerId = :customerId')
  Future<List<Vehicle>> getVehiclesByCustomerID(String customerId);

  @Query('SELECT * FROM Vehicle WHERE webVehicleId = :webVehicleId')
  Future<Vehicle?> getVehicleByWebID(int webVehicleId);

  @Query('SELECT * FROM Vehicle WHERE isSync = :isSync')
  Future<List<Vehicle>> getVehicleBySyncFlag(int isSync);

  @insert
  @OnConflictStrategy.replace
  Future<int> insertVehicle(Vehicle vehicle);

  @update
  Future<int> updateVehicle(Vehicle vehicle);

  @Query('UPDATE Vehicle SET isSync = :sync, webVehicleId = :webID WHERE vehicleId = :vehicleId ')
  Future<int?> updateSyncWebID(int sync, int webID, String vehicleId);
}
