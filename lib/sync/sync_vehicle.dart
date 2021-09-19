import 'package:offline_app/db/dao/customer_dao.dart';
import 'package:offline_app/db/dao/vehicle_dao.dart';
import 'package:offline_app/db/db_operations.dart';
import 'package:offline_app/db/entity/customer.dart';
import 'package:offline_app/db/entity/vehicle.dart';
import 'package:offline_app/remote/models/vehicle_r.dart';
import 'package:offline_app/repository/api_repository.dart';
import 'package:offline_app/utils/constants.dart';

Future<void> uploadVehicleSync(DBOperations db, ApiRepository apiRepository) async {
  VehicleDao dao = await db.getVehicleDao();
  CustomerDao customerDao = await db.getCustomerDao();
  List<Vehicle> list = await dao.getVehicleBySyncFlag(0);
  if (list.isNotEmpty) {
    await Future.forEach(list, (Vehicle element) async {
      Customer? customer =
          await customerDao.getWebCustomerID(element.customerId);
      if (customer != null && customer.webCustomerId > 0) {
        final vehicleR = VehicleR.convert(element, customer.webCustomerId);
        int result = await apiRepository.apiAddVehicle(vehicleR.toJson());
        if (result != kIntMaxValue) {
          element.webVehicleId = result;
          element.isSync = 1;
          element.updatedDT = DateTime.now();
          await dao.updateSyncWebID(1, result, element.vehicleId);
        }
      }
    });
  }
}

Future<void> downloadVehicleSync(
    DBOperations db, ApiRepository apiRepository) async {
  List<VehicleR> result = await apiRepository.getVehicles();
  if (result.isNotEmpty) {
    await Future.forEach(result, (VehicleR element) async {
      CustomerDao dao = await db.getCustomerDao();
      VehicleDao vehicleDao = await db.getVehicleDao();
      if (element.vehicleId != null) {
        Vehicle? vehicle = await vehicleDao.getVehicleByWebID(element.vehicleId!);
        if (vehicle != null) {
          Vehicle updateVehicle = Vehicle.convert(element, vehicle.vehicleId, vehicle.customerId);
          await vehicleDao.updateVehicle(updateVehicle);
        } else {
          Vehicle vehicle = Vehicle.convert(element, element.vehicleId.toString(), element.customerId.toString());
          await vehicleDao.insertVehicle(vehicle);
        }
      }
    });
  }
}
