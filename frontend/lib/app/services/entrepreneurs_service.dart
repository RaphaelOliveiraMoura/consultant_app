import 'dart:convert';

import 'package:consultant_app/app/utils/http_error_utils.dart';
import 'package:consultant_app/app/utils/service_utils.dart';
import 'package:http/http.dart' as http;

class EntrepreneursService {
  static create(entrepreneurFormData) async {
    var response = await http.post('${ServiceUtils.apiUrl}/entrepreneurs',
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          "email": entrepreneurFormData['email'],
          "password": entrepreneurFormData['password'],
          "confirmPassword": entrepreneurFormData['confirmPassword']
        }));

    if (response.statusCode == 400) {
      String error = jsonDecode(response.body)['error'];

      if (error == 'email_already_exists') {
        throw HttpError(type: 'email_already_exists');
      }

      if (error == 'password_mismatch') {
        throw HttpError(type: 'password_mismatch');
      }
    }

    catchError(response.statusCode);
  }
}
