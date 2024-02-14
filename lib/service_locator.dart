import 'package:get_it/get_it.dart';
import 'package:weatherc/features/settings/cubit/settings_cubit.dart';
import 'package:weatherc/weather/data/datasource/weather_datasource.dart';
import 'package:weatherc/weather/data/impl/weather_impl.dart';
import 'package:weatherc/weather/domain/repo/weather_repo.dart';
import 'package:weatherc/weather/domain/usecases/get_weather.dart';
import 'package:weatherc/weather/view/bloc/cubit/get_weather_cubit_cubit.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;
void init() {
  // bloc
  sl.registerFactory(() => GetWeatherCubitCubit(sl()));
  sl.registerFactory(() => SettingsCubit());

  // use cases
  sl.registerLazySingleton(() => GetWeatherUseCase(weatherRepo: sl()));
  // repo
  sl.registerLazySingleton<WeatherRepo>(() => WeatherImpl(sl()));
  //data source

  sl.registerLazySingleton<WeatherRemoteDataSource>(() => WeatherDSIHttp(sl()));
  //core

  // external
  sl.registerLazySingleton(() => http.Client());
}
