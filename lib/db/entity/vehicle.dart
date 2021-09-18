import 'package:floor/floor.dart';
import 'package:offline_app/db/entity/customer.dart';

@Entity(foreignKeys: [
  ForeignKey(
      childColumns: ['customerId'],
      parentColumns: ['customerId'],
      entity: Customer)
])
class Vehicle {
  @PrimaryKey()
  final String vehicleId;
  final String vehno;
  final int webVehicleId;
  final int isSync;
  final DateTime updatedDT;
  final String customerId;

  Vehicle(this.vehicleId, this.vehno, this.updatedDT, this.customerId,
      {this.webVehicleId = 0, this.isSync = 0});
}
