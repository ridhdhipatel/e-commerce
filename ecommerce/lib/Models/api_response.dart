// To parse this JSON data, do
//
//     final apiResponse = apiResponseFromJson(jsonString);

import 'dart:convert';

ApiResponse apiResponseFromJson(String str) =>
    ApiResponse.fromJson(json.decode(str));

String apiResponseToJson(ApiResponse data) => json.encode(data.toJson());

class ApiResponse<T> {
  ApiResponse({
    this.status,
    this.code,
    this.message,
    this.data,
    this.token,
    this.firmname,
  });

  String? status;
  String? code;
  String? message;
  T? data;
  String? token;
  String? firmname;

  factory ApiResponse.fromJson(Map<String, dynamic> json) => ApiResponse(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        data: json["data"],
        token: json["token"],
        firmname: json["firmname"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "message": message,
        "data": data,
        "token": token,
        "firmname": firmname,
      };
}
