import 'dart:convert';

import 'package:consultant_app/app/utils/http_error_utils.dart';
import 'package:consultant_app/app/utils/service_utils.dart';
import 'package:http/http.dart' as http;

class ConsultantService {
  static create(consultantFormData) async {
    var response = await http.post('${ServiceUtils.apiUrl}/consultants',
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          "specialization": consultantFormData['specialization'],
          "name": consultantFormData['name'],
          "email": consultantFormData['email'],
          "password": consultantFormData['password'],
          "confirmPassword": consultantFormData['confirmPassword']
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

  static getAll() async {
    var response = await http.get('${ServiceUtils.apiUrl}/consultants');

    catchError(response.statusCode);

    if (response.statusCode == 200) {
      return jsonDecode(response.body).map((consultant) {
        String firstLetter = consultant['name'][0].toUpperCase();
        String secondLetter = consultant['name'][1].toUpperCase();

        String initials = '$firstLetter$secondLetter';

        return {
          "initials": initials,
          "specialization": consultant['specialization'],
          "name": consultant['name'],
          "email": consultant['email'],
        };
      }).toList();
    }
  }
}
