import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Constants/constants.dart';
import '../Models/models.dart';
import '../Utils/utils.dart';

class LoginProvider extends ChangeNotifier {
  Future<String> customerLogin(String loginRequest) async {
    Shared shared = Shared();
    return http
        .post(Uri.parse('${Consts.baseUrl}Login/CheckLogin'),
            body: loginRequest, headers: Consts.headers)
        .then((response) {
      var loginResponse = apiResponseFromJson(response.body);
      if (loginResponse.status != 'False') {
        shared.setLogin(true);
        shared.setToken(loginResponse.token ?? '');
        return loginResponse.message ?? '';
      } else {
        return 'Login Fail';
      }
    }).catchError((error) {
      return '$error';
    });
  }
}
