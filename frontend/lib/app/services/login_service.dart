import 'dart:convert';

import 'package:consultant_app/app/utils/http_error_utils.dart';
import 'package:consultant_app/app/utils/service_utils.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginService {
  static login({formData, bool isConsultant}) async {
    String url = isConsultant
        ? '${ServiceUtils.apiUrl}/consultants/auth'
        : '${ServiceUtils.apiUrl}/entrepreneurs/auth';

    var response = await http.post(url,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          "email": formData['email'],
          "password": formData['password'],
        }));

    catchError(response.statusCode);

    if (response.statusCode == 200) {
      var consultant = jsonDecode(response.body);

      var sharedPreferencesInstance = await SharedPreferences.getInstance();

      await sharedPreferencesInstance.setBool('isLoggedIn', true);
      await sharedPreferencesInstance.setBool('isConsultant', isConsultant);
      await sharedPreferencesInstance.setInt('id', consultant['id']);

      return null;
    }
  }

  static logout() async {
    var sharedPreferencesInstance = await SharedPreferences.getInstance();

    await sharedPreferencesInstance.clear();
  }
}
