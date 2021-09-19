import 'package:offline_app/db/dao/customer_dao.dart';
import 'package:offline_app/db/db_operations.dart';
import 'package:offline_app/db/entity/customer.dart';
import 'package:offline_app/remote/models/customer_r.dart';
import 'package:offline_app/repository/api_repository.dart';
import 'package:offline_app/utils/constants.dart';

Future<void> uploadCustomerSync(
    DBOperations db, ApiRepository apiRepository) async {
  CustomerDao dao = await db.getCustomerDao();
  List<Customer> list = await dao.getCustomerBySyncFlag(0);
  if (list.isNotEmpty) {
    await Future.forEach(list, (Customer element) async {
      final cust = CustomerR.convert(element);
      int result = await apiRepository.apiAddCustomer(cust.toJson());
      if (result != kIntMaxValue) {
        await dao.updateSyncWebID(1, result, element.customerId);
      }
    });
  }
}

Future<void> downloadCustomerSync(
    DBOperations db, ApiRepository apiRepository) async {
  List<CustomerR> result = await apiRepository.getCustomers();
  if (result.isNotEmpty) {
    await Future.forEach(result, (CustomerR element) async {
      CustomerDao dao = await db.getCustomerDao();
      if (element.id != null) {
        Customer? customer = await dao.getCustomerByWebID(element.id!);
        if (customer != null) {
          Customer updateCustomer =
              Customer.convert(element, customer.customerId);
          await dao.updateCustomer(updateCustomer);
        } else {
          Customer customer = Customer.convert(element, element.id.toString());
          await dao.insertCustomer(customer);
        }
      }
    });
  }
}
