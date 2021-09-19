import 'dart:convert';

import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:offline_app/utils/resource.dart';

import 'models/base_response.dart';

class DioClient extends GetxController {
  final String kBaseUrl = "http://192.168.0.105:33661";

  Future<Resource<T?>?> makeNetworkCall<T>(
      {required String endPoint,
      required String method,
      dynamic data,
      Map<String, dynamic>? headers,
      required Function parse}) async {
    try {
      String path = kBaseUrl + endPoint;
      print('Url $path');
      print('Method $method');
      print('Payload ${json.encode(data)}');
      final response = await dio.Dio().fetch(dio.RequestOptions(
          path: path,
          method: method,
          headers: headers,
          data: json.encode(data),
          receiveDataWhenStatusError: true,
          connectTimeout: 60 * 1000,
          receiveTimeout: 60 * 1000));
      print("Url : ${response.realUri}");
      print("Response : $response");
      if (response.data != null) {
        final data = BaseResponse<T>.fromJson(response.data, parse);
        if (data.isError == false) {
          print(data.message);
          return Resource.withData(data.value!);
        } else {
          return Resource.withError(data.message!);
        }
      }
    } on dio.DioError catch (exception) {
      print(exception.message);
      return Resource.withError(exception.message);
    } on Exception catch (exception) {
      print(exception);
      return Resource.withError(exception.toString());
    }
    return null;
  }
}
