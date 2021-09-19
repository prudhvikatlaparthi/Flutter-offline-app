import 'dart:convert';

import 'customer_r.dart';


CustomersResponse CustomersResponseFromJson(String str) =>
    CustomersResponse.fromJson(json.decode(str));

class CustomersResponse {
  CustomersResponse({
    this.customerRs,
  });

  final List<CustomerR>? customerRs;

  CustomersResponse copyWith({
    List<CustomerR>? customerRs,
  }) =>
      CustomersResponse(
        customerRs: customerRs ?? this.customerRs,
      );

  factory CustomersResponse.fromJson(Map<String, dynamic> json) =>
      CustomersResponse(
        customerRs: json["CustomerRs"] == null
            ? null
            : List<CustomerR>.from(
            json["customerRs"].map((x) => CustomerR.fromJson(x))),
      );
}