// To parse this JSON data, do
//
//     final customerLogin = customerLoginFromJson(jsonString);

import 'dart:convert';

CustomerLogin customerLoginFromJson(String str) =>
    CustomerLogin.fromJson(json.decode(str));

String customerLoginToJson(CustomerLogin data) => json.encode(data.toJson());

class CustomerLogin {
  CustomerLogin({
    this.username,
    this.password,
    this.adminId,
  });

  String? username;
  String? password;
  int? adminId;

  factory CustomerLogin.fromJson(Map<String, dynamic> json) => CustomerLogin(
        username: json["username"],
        password: json["password"],
        adminId: json["adminId"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
        "adminId": adminId,
      };
}
