import 'dart:convert';

import 'package:consultant_app/app/utils/http_error_utils.dart';
import 'package:consultant_app/app/utils/service_utils.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class VideoContentService {
  static saveContent(data) async {
    var sharedPreferencesInstance = await SharedPreferences.getInstance();

    int id = sharedPreferencesInstance.getInt('id');

    var response = await http.post('${ServiceUtils.apiUrl}/videos',
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': id.toString()
        },
        body: jsonEncode({
          "youtubeUrl": data['youtubeUrl'],
          "title": data['title'],
          "description": data['description']
        }));

    catchError(response.statusCode);
  }
}
