import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatherc/core/constants.dart';
import 'package:weatherc/core/failures.dart';
import 'package:weatherc/weather/domain/model/weather_model.dart';

abstract class WeatherRemoteDataSource {
  Future<WeatherModel> getWeather(
      {required String city, int? days, Languages? languages});
}

class WeatherDSIHttp implements WeatherRemoteDataSource {
  final http.Client client;

  WeatherDSIHttp(this.client);

  @override
  Future<WeatherModel> getWeather(
      {required String city, int? days, Languages? languages}) async {
    String languageCode = '';
    int day = 3;
    if (days == 1) {
      day = 1;
    } else if (days == 2) {
      day = 2;
    } else if (days == 0) {
      day = 0;
    }

    if (languages == Languages.french) {
      languageCode = 'fr';
    } else if (languages == Languages.arabic) {
      languageCode = 'ar';
    } else {
      languageCode = 'en';
    }

    var url = Uri.parse(
        "https://weatherapi-com.p.rapidapi.com/forecast.json?q=$city&days=$day&lang=$languageCode");
    var headers = {
      "X-RapidAPI-Key": "e078b36ed7msh40d29d1970836e9p19d8b7jsn99a9d7701cdb",
      "X-RapidAPI-Host": "weatherapi-com.p.rapidapi.com",
      "authy": 'bombaclat'
    };

    try {
      var response = await http.get(url, headers: headers);
      print(
          ' there is a problem  @@@@@@@@@@@@@@@@@@@ response.statusCode = ${response.statusCode} and reponse is ${response.body}');

      if (response.statusCode == 200) {
        print('++++++++++++++++the thing got through ++++++++++++++++');
        var body = response.body;
        Map<String, dynamic> parsedBody = jsonDecode(body);
        print('++++++++++++++++the parsed body ${parsedBody} ++++++++++++++++');
        WeatherModel weatherModel = WeatherModel.fromJson(parsedBody);
        print(' this is the weather model ++++++++++++++++ $weatherModel');
        return weatherModel;
      } else {
        print(' there is a problem  @@@@@@@@@@@@@@@@@@@');
        throw ServerException(statusCode: response.statusCode);
      }
    } catch (e) {
      throw EException(e: e.toString());
    }
  }
}
