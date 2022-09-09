import 'package:weather/domain/entities/city.dart';
import 'package:weather/domain/entities/city_weather.dart';
import 'package:weather/domain/errors/error.dart';

abstract class SearchWeatherState {}

class SearchWeatherStart extends SearchWeatherState {}

class SearchWeatherLoadgin extends SearchWeatherState {}

class SearchWeatherSuccess extends SearchWeatherState {
  final CityWeather data;
  final City city;

  SearchWeatherSuccess({required this.data, required this.city});
}

class SearchWeatherError extends SearchWeatherState {
  final SystemError error;

  SearchWeatherError(this.error);
}
