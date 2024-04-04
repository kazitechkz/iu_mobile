class ResponseData<T> {
  bool? status;
  String? message;
  Errors? errors;
  T? data;
  List<T>? listData;

  ResponseData({this.status, this.message, this.errors, this.data, this.listData});

  ResponseData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    errors =
        json['errors'] != null ? Errors.fromJson(json['errors']) : null;
    data = json['data'];
  }

  factory ResponseData.fromJsonList(Map<String, dynamic> json, T Function(dynamic json) fromJsonData) {
    return ResponseData<T>(
      status: json['status'],
      message: json['message'],
      errors: json['errors'] != null ? Errors.fromJson(json['errors']) : null,
      listData: json['data'] != null ? _listFromJson<T>(json['data'], fromJsonData) : null,
    );
  }

  static List<T> _listFromJson<T>(List<dynamic> jsonList, T Function(dynamic json) fromJsonData) {
    return jsonList.map((dynamic json) => fromJsonData(json)).toList();
  }
}

class Errors {
  final Map<String, List<String>> errors;

  Errors({required this.errors});

  factory Errors.fromJson(Map<String, dynamic> json) {
    Map<String, List<String>> errorsMap = {};
    json.forEach((key, value) {
      errorsMap[key] = List<String>.from(value);
    });
    return Errors(errors: errorsMap);
  }
}
