class ResponseData<T> {
  bool? status;
  String? message;
  Errors? errors;
  T? data;

  ResponseData({this.status, this.message, this.errors, this.data});

  ResponseData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    errors =
        json['errors'] != null ? new Errors.fromJson(json['errors']) : null;
    data = json['data'];
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
