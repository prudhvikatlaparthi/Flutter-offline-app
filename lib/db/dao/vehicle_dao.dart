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

  @insert
  @OnConflictStrategy.replace
  Future<int> insertVehicle(Vehicle vehicle);
}
