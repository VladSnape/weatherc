import 'package:dartz/dartz.dart';
import 'package:weatherc/core/constants.dart';
import 'package:weatherc/core/failures.dart';
import 'package:weatherc/weather/domain/model/weather_model.dart';
import 'package:weatherc/weather/domain/repo/weather_repo.dart';

class GetWeatherUseCase {
  final WeatherRepo weatherRepo;

  GetWeatherUseCase({required this.weatherRepo});
  Future<Either<Failure, WeatherModel>> call(
      {required String city, int? days, Languages? languages}) async {
    return await weatherRepo.getWeather(
        city: city, languages: languages, days: days);
  }
}
