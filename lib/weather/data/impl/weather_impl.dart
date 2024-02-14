import 'package:dartz/dartz.dart';
import 'package:weatherc/core/constants.dart';
import 'package:weatherc/core/failures.dart';
import 'package:weatherc/weather/data/datasource/weather_datasource.dart';
import 'package:weatherc/weather/domain/model/weather_model.dart';
import 'package:weatherc/weather/domain/repo/weather_repo.dart';

class WeatherImpl implements WeatherRepo {
  final WeatherRemoteDataSource weatherRemoteDataSource;

  WeatherImpl(this.weatherRemoteDataSource);
  @override
  Future<Either<Failure, WeatherModel>> getWeather(
      {required String city, int? days, Languages? languages}) async {
    try {
      final WeatherModel result = await weatherRemoteDataSource.getWeather(
          city: city, days: days, languages: languages);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.statusCode));
    } on EException catch (e) {
      return Left(Efailure(e.e));
    }
  }
}
