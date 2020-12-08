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

    catchError(response.statusCode);
  }

  static getAll() async {
    var response = await http.get('${ServiceUtils.apiUrl}/consultants');

    catchError(response.statusCode);

    if (response.statusCode == 200) {
      return jsonDecode(response.body).map((consultant) {
        return {
          "specialization": consultant['specialization'],
          "name": consultant['name'],
          "email": consultant['email'],
        };
      }).toList();
    }
  }
}
