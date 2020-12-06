import 'dart:convert';

import 'package:consultant_app/app/utils/http_error_utils.dart';
import 'package:consultant_app/app/utils/service_utils.dart';
import 'package:http/http.dart' as http;

class ExplorerService {
  static getVideoContent() async {
    var response = await http.get('${ServiceUtils.apiUrl}/explorer');

    print(response.statusCode == 200);

    if (response.statusCode == 200) {
      return jsonDecode(response.body).map((videoContent) {
        String youtubeCode =
            Uri.dataFromString(videoContent['youtubeUrl']).queryParameters['v'];

        return {
          'category': videoContent['consultant']['specialization'],
          'youtubeCode': youtubeCode,
          'title': videoContent['title'],
          'description': videoContent['description']
        };
      }).toList();
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
