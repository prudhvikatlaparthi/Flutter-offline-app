import 'package:floor/floor.dart';
import 'package:offline_app/db/entity/customer.dart';
import 'package:offline_app/remote/models/vehicle_r.dart';

@Entity(foreignKeys: [
  ForeignKey(
      childColumns: ['customerId'],
      parentColumns: ['customerId'],
      entity: Customer)
])
class Vehicle {
  @PrimaryKey()
  String vehicleId;
  String vehno;
  int webVehicleId;
  int isSync;
  DateTime updatedDT;
  String customerId;

  Vehicle(this.vehicleId, this.vehno, this.updatedDT, this.customerId,
      {this.webVehicleId = 0, this.isSync = 0});

  factory Vehicle.convert(
          VehicleR vehicleR, String vehicleId, String? customerId) =>
      Vehicle(vehicleId, vehicleR.vehno ?? 'UnKnown', DateTime.now(),
          customerId ?? vehicleR.customerId!.toString(),
          webVehicleId: vehicleR.vehicleId!, isSync: 1);
}
