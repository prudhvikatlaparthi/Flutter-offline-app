// To parse this JSON data, do
//
//     final vehicleR = vehicleRFromJson(jsonString);

import 'dart:convert';

import 'package:offline_app/db/db_operations.dart';
import 'package:offline_app/db/entity/vehicle.dart';

VehicleR vehicleRFromJson(String str) => VehicleR.fromJson(json.decode(str));

String vehicleRToJson(VehicleR data) => json.encode(data.toJson());

class VehicleR {
  VehicleR({
    this.customerId,
    this.vehicleId,
    this.vehno,
  });

  final int? customerId;
  final int? vehicleId;
  final String? vehno;

  VehicleR copyWith({
    int? customerId,
    int? vehicleId,
    String? vehno,
  }) =>
      VehicleR(
        customerId: customerId ?? this.customerId,
        vehicleId: vehicleId ?? this.vehicleId,
        vehno: vehno ?? this.vehno,
      );

  factory VehicleR.convert(Vehicle vehicle, int webCustomerId) {
    return VehicleR(
        vehicleId: vehicle.webVehicleId,
        vehno: vehicle.vehno,
        customerId: webCustomerId);
  }

  factory VehicleR.fromJson(Map<String, dynamic> json) => VehicleR(
        customerId: json["customer_id"],
        vehicleId: json["vehicleId"],
        vehno: json["vehno"],
      );

  Map<String, dynamic> toJson() => {
        "customer_id": customerId,
        "vehicleId": vehicleId,
        "vehno": vehno,
      };
}
