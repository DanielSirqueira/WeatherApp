import 'package:weather/domain/entities/city.dart';

abstract class WeatherEvent {}

class GetGeolocationWeatherEvent extends WeatherEvent {}

class GetWeatherEvent extends WeatherEvent {
  final City city;

  GetWeatherEvent(this.city);
}
