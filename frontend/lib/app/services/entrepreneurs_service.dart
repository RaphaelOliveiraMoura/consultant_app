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

    if (response.statusCode == 201) {
      return;
    }

    switch (response.statusCode) {
      case 404:
        throw new HttpError(type: HttpErrorTypes.serverNotFound);
      case 401:
        throw new HttpError(type: HttpErrorTypes.unauthorized);
      case 400:
        throw new HttpError(type: HttpErrorTypes.invalidPayload);
      default:
        throw new HttpError(type: HttpErrorTypes.unhandledError);
    }
  }
}
