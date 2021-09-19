class BaseResponse<T> {
  bool? isError;
  String? message;
  T? value;

  BaseResponse({this.isError, this.message, this.value});

  factory BaseResponse.fromJson(
      Map<String, dynamic> json, Function fromJsonModel) {
    return BaseResponse<T>(
        isError: json['isError'],
        message: json['message'],
        value: getValue(json, fromJsonModel));
  }

  static dynamic getValue(
      Map<String, dynamic> json, Function fromJsonModel) {
    if (json['value'] != null) {
      if (json['value'] is int) {
        return json['value'] as int;
      } else if (json['value'] is String) {
        return json['value'] as String;
      } else if (json['value'] is bool) {
        return json['value'] as bool;
      } else {
        return fromJsonModel(json['value']);
      }
    }
    return null;
  }
}