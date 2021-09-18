import 'package:floor/floor.dart';

@entity
class Customer {
  @primaryKey
  final String customerId;
  final String name;
  String? email;
  final int webCustomerId;
  final int isSync;
  final DateTime updatedDT;

  Customer(this.customerId, this.name, this.updatedDT,
      {this.webCustomerId = 0, this.isSync = 0, this.email});
}
