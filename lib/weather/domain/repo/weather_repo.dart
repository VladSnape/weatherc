import 'package:dartz/dartz.dart';
import 'package:weatherc/core/constants.dart';
import 'package:weatherc/core/failures.dart';
import 'package:weatherc/weather/domain/model/weather_model.dart';

abstract class WeatherRepo {
  Future<Either<Failure, WeatherModel>> getWeather(
      {required String city, int? days, Languages? languages});
}
