import 'package:get/get.dart';
import 'package:offline_app/db/dao/vehicle_dao.dart';
import 'package:offline_app/db/db_operations.dart';
import 'package:offline_app/db/entity/vehicle.dart';

class DetailController extends GetxController{
  late VehicleDao vehicleDao;
  final vehicleList = <Vehicle>[].obs;

  @override
  Future<void> onInit() async {
    vehicleDao = await DBOperations().getVehicleDao();
    getCustomers(Get.arguments[0]);
    super.onInit();
  }

  addCustomer(Vehicle vehicle) async {
    final result = await vehicleDao.insertVehicle(vehicle);
    if (result != 0) {
      getCustomers(Get.arguments[0]);
    }
  }

  void getCustomers(String customerId) async {
    final data = await vehicleDao.getVehiclesByCustomerID(customerId);
    vehicleList.clear();
    vehicleList.addAll(data);
  }
}