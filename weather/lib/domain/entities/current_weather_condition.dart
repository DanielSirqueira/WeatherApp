import 'package:weather/domain/entities/types/type_weather.dart';

export 'current_weather_condition.dart';

class CurrentWeatherCondition {
  int feelsLike;
  int cloudCover;
  int humidity;
  int pressure;
  int temp;
  int uvIndex;
  TypeWeather typeWeather;
  int windSpeedKm;

  CurrentWeatherCondition({
    required this.feelsLike,
    required this.cloudCover,
    required this.humidity,
    required this.pressure,
    required this.temp,
    required this.uvIndex,
    required this.typeWeather,
    required this.windSpeedKm,
  });
}
