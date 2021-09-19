// To parse this JSON data, do
//
//     final customerR = customerRFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:offline_app/db/entity/customer.dart';

CustomerR customerRFromJson(String str) => CustomerR.fromJson(json.decode(str));

String customerRToJson(CustomerR data) => json.encode(data.toJson());

class CustomerR {
  CustomerR({
    this.email,
    this.id,
    this.name,
  });

  final String? email;
  final int? id;
  final String? name;

  CustomerR copyWith({
    String? email,
    int? id,
    String? name,
  }) =>
      CustomerR(
        email: email ?? this.email,
        id: id ?? this.id,
        name: name ?? this.name,
      );

  factory CustomerR.convert(Customer customer) => CustomerR(
      email: customer.email, id: customer.webCustomerId, name: customer.name);

  factory CustomerR.fromJson(Map<String, dynamic> json) => CustomerR(
        email: json["email"],
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "id": id,
        "name": name,
      };
}
