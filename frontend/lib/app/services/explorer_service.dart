import 'dart:convert';

import 'package:consultant_app/app/utils/http_error_utils.dart';
import 'package:consultant_app/app/utils/service_utils.dart';
import 'package:http/http.dart' as http;

class ExplorerService {
  static getVideoContent() async {
    var response = await http.get('${ServiceUtils.apiUrl}/explorer');

    catchError(response.statusCode);

    if (response.statusCode == 200) {
      return jsonDecode(response.body).map((videoContent) {
        return {
          'category': videoContent['consultant']['specialization'],
          'consultantName': videoContent['consultant']['name'],
          'youtubeUrl': videoContent['youtubeUrl'],
          'title': videoContent['title'],
          'description': videoContent['description']
        };
      }).toList();
    }
  }
}
