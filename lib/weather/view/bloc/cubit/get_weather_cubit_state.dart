part of 'get_weather_cubit_cubit.dart';

sealed class GetWeatherCubitState extends Equatable {
  const GetWeatherCubitState();

  @override
  List<Object> get props => [];
}

final class GetWeatherCubitInitial extends GetWeatherCubitState {}

final class GetWeatherCubitSuccess extends GetWeatherCubitState {
  final WeatherModel weatherModel;

  const GetWeatherCubitSuccess(this.weatherModel);
}

final class GetWeatherCubitLaoding extends GetWeatherCubitState {}

final class GetWeatherCubitFailed extends GetWeatherCubitState {
  final String message;

  const GetWeatherCubitFailed(this.message);
}
