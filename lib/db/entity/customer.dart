import 'package:floor/floor.dart';
import 'package:offline_app/remote/models/customer_r.dart';

@entity
class Customer {
  @primaryKey
  String customerId;
  String name;
  String? email;
  int webCustomerId;
  int isSync;
  DateTime updatedDT;

  Customer(this.customerId, this.name, this.updatedDT,
      {this.webCustomerId = 0, this.isSync = 0, this.email});

  factory Customer.convert(CustomerR customer, String customerId) =>
      Customer(customerId, customer.name ?? 'UnKnown', DateTime.now(),
          webCustomerId: customer.id!, email: customer.email,isSync: 1);
}
