// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weatherc/core/constants.dart';

import 'package:weatherc/weather/domain/model/weather_model.dart';
import 'package:weatherc/weather/domain/usecases/get_weather.dart';

part 'get_weather_cubit_state.dart';

class GetWeatherCubitCubit extends Cubit<GetWeatherCubitState> {
  final GetWeatherUseCase getWeatherUseCase;
  GetWeatherCubitCubit(
    this.getWeatherUseCase,
  ) : super(GetWeatherCubitInitial()) {
    getWeather(city: 'london');
  }
  getWeather({required String city, int? days, Languages? languages}) async {
    emit(GetWeatherCubitLaoding());
    final result = await getWeatherUseCase.call(
        city: city, languages: languages, days: days);
    print(result);
    result.fold((l) {
      emit(GetWeatherCubitFailed(l.toString()));
    }, (r) {
      emit(GetWeatherCubitSuccess(r));
    });
  }
}
