import 'package:get/get.dart';
import 'package:offline_app/remote/dio_client.dart';
import 'package:offline_app/remote/models/customer_r.dart';
import 'package:offline_app/remote/models/vehicle_r.dart';
import 'package:offline_app/utils/constants.dart';
import 'package:offline_app/utils/dio_utils.dart';
import 'package:offline_app/utils/resource.dart';

class ApiRepository extends GetxController {
  final dioClient = Get.find<DioClient>();

  Future<int> apiAddCustomer(Map<String, dynamic> body) async {
    Resource<int?>? data = await dioClient.makeNetworkCall<int?>(
        endPoint: kAddCustomer,
        method: Method.POST.getValue(),
        data: body,
        parse: (json) => null);
    if (data != null) {
      if (data.hasData) {
        return data.data ?? kIntMaxValue;
      }
    }
    return kIntMaxValue;
  }

  Future<int> apiAddVehicle(Map<String, dynamic> body) async {
    Resource<int?>? data = await dioClient.makeNetworkCall<int?>(
        endPoint: kAddVehicle,
        method: Method.POST.getValue(),
        data: body,
        parse: (json) => null);
    if (data != null) {
      if (data.hasData) {
        return data.data ?? kIntMaxValue;
      }
    }
    return kIntMaxValue;
  }

  Future<List<CustomerR>> getCustomers() async {
    Resource<List<CustomerR>?>? data =
        await dioClient.makeNetworkCall<List<CustomerR>?>(
            endPoint: kGetCustomers,
            method: Method.GET.getValue(),
            parse: (json) => List<CustomerR>.from(json
                .cast<Map<String, dynamic>>()
                .map((itemsJson) => CustomerR.fromJson(itemsJson))));
    if (data != null) {
      if (data.hasData) {
        return data.data ?? [];
      }
    }
    return [];
  }

  Future<List<VehicleR>> getVehicles() async {
    Resource<List<VehicleR>?>? data =
    await dioClient.makeNetworkCall<List<VehicleR>?>(
        endPoint: kGetVehicles,
        method: Method.GET.getValue(),
        parse: (json) => List<VehicleR>.from(json
            .cast<Map<String, dynamic>>()
            .map((itemsJson) => VehicleR.fromJson(itemsJson))));
    if (data != null) {
      if (data.hasData) {
        return data.data ?? [];
      }
    }
    return [];
  }
}
