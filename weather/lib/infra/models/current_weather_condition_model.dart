// ignore_for_file: overridden_fields

import 'dart:convert';

import 'package:weather/domain/entities/current_weather_condition.dart';
import 'package:weather/domain/entities/types/type_weather.dart';

class CurrentWeatherConditionModel extends CurrentWeatherCondition {
  CurrentWeatherConditionModel({
    required int feelsLike,
    required int cloudCover,
    required int humidity,
    required int pressure,
    required int temp,
    required int uvIndex,
    required TypeWeather typeWeather,
    required int windSpeedKm,
  }) : super(
          feelsLike: feelsLike,
          cloudCover: cloudCover,
          humidity: humidity,
          pressure: pressure,
          temp: temp,
          uvIndex: uvIndex,
          typeWeather: typeWeather,
          windSpeedKm: windSpeedKm,
        );

  factory CurrentWeatherConditionModel.fromMap(Map<String, dynamic> map) {
    return CurrentWeatherConditionModel(
      feelsLike: int.parse(map['FeelsLikeC']),
      cloudCover: int.parse(map['cloudcover']),
      humidity: int.parse(map['humidity']),
      pressure: int.parse(map['pressure']),
      temp: int.parse(map['temp_C']),
      uvIndex: int.parse(map['uvIndex']),
      typeWeather: TypeWeather(int.parse(map['weatherCode'])),
      windSpeedKm: int.parse(map['windspeedKmph']),
    );
  }
}
