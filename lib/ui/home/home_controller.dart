import 'package:get/get.dart';
import 'package:offline_app/db/dao/customer_dao.dart';
import 'package:offline_app/db/db_operations.dart';
import 'package:offline_app/db/entity/customer.dart';

class HomeController extends GetxController {
  late CustomerDao customerDao;
  final customerList = <Customer>[].obs;

  @override
  Future<void> onInit() async {
    customerDao = await DBOperations().getCustomerDao();
    getCustomers();
    super.onInit();
  }

  addCustomer(Customer customer) async {
    final result = await customerDao.insertCustomer(customer);
    if (result != 0) {
      getCustomers();
    }
  }

  void getCustomers() async {
    final data = await customerDao.getAllCustomers();
    customerList.clear();
    customerList.addAll(data);
  }
}
