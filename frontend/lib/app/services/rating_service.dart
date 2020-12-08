import 'dart:convert';

import 'package:consultant_app/app/utils/http_error_utils.dart';
import 'package:consultant_app/app/utils/service_utils.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class RatingService {
  static listRatings() async {
    var sharedPreferencesInstance = await SharedPreferences.getInstance();

    int id = sharedPreferencesInstance.getInt('id');
    bool isConsultant = sharedPreferencesInstance.getBool('isConsultant');

    String url = isConsultant
        ? '${ServiceUtils.apiUrl}/consultants/ratings'
        : '${ServiceUtils.apiUrl}/entrepreneurs/ratings';

    var response =
        await http.get(url, headers: {'authorization': id.toString()});

    catchError(response.statusCode);

    if (response.statusCode == 200) {
      return jsonDecode(response.body).map((ratingObject) {
        return {
          "questionId": ratingObject['question']['id'],
          "question": ratingObject['question']['title'],
          "rating": ratingObject['rating'],
        };
      }).toList();
    }
  }

  static rate({rating, questionId}) async {
    var sharedPreferencesInstance = await SharedPreferences.getInstance();

    int id = sharedPreferencesInstance.getInt('id');
    bool isConsultant = sharedPreferencesInstance.getBool('isConsultant');

    String url = isConsultant
        ? '${ServiceUtils.apiUrl}/consultants/ratings'
        : '${ServiceUtils.apiUrl}/entrepreneurs/ratings';

    var response = await http.put(url,
        headers: {
          'Authorization': id.toString(),
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode({
          "questionId": questionId,
          "rating": rating,
        }));

    catchError(response.statusCode);
  }
}
