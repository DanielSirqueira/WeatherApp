// ignore_for_file: overridden_fields

import 'dart:convert';

import 'package:weather/domain/entities/current_weather_condition.dart';
import 'package:weather/domain/entities/types/type_weather.dart';

class CurrentWeatherConditionModel extends CurrentWeatherCondition {
  @override
  int feelsLike;
  @override
  int cloudCover;
  @override
  int humidity;
  @override
  int pressure;
  @override
  int temp;
  @override
  int uvIndex;
  @override
  TypeWeather typeWeather;
  @override
  int windSpeedKm;

  CurrentWeatherConditionModel({
    required this.feelsLike,
    required this.cloudCover,
    required this.humidity,
    required this.pressure,
    required this.temp,
    required this.uvIndex,
    required this.typeWeather,
    required this.windSpeedKm,
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

  Map<String, dynamic> toMap() {
    return {
      'FeelsLikeC': feelsLike,
      'cloudcover': cloudCover,
      'humidity': humidity,
      'pressure': pressure,
      'temp_C': temp,
      'uvIndex': uvIndex,
      'weatherCode': typeWeather,
      'windspeedKmph': windSpeedKm,
    };
  }

  factory CurrentWeatherConditionModel.fromMap(Map<String, dynamic> map) {
    return CurrentWeatherConditionModel(
      feelsLike:
          map['FeelsLikeC']?.isNotEmpty ? int.parse(map['FeelsLikeC']) : 0,
      cloudCover:
          map['cloudcover']?.isNotEmpty ? int.parse(map['cloudcover']) : 0,
      humidity: map['humidity']?.isNotEmpty ? int.parse(map['humidity']) : 0,
      pressure: map['pressure']?.isNotEmpty ? int.parse(map['pressure']) : 0,
      temp: map['temp_C']?.isNotEmpty ? int.parse(map['temp_C']) : 0,
      uvIndex: map['uvIndex']?.isNotEmpty ? int.parse(map['uvIndex']) : 0,
      typeWeather: map['weatherCode']?.isNotEmpty
          ? TypeWeather(int.parse(map['weatherCode']))
          : TypeWeather(0),
      windSpeedKm: map['windspeedKmph']?.isNotEmpty
          ? int.parse(map['windspeedKmph'])
          : 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory CurrentWeatherConditionModel.fromJson(String source) =>
      CurrentWeatherConditionModel.fromMap(json.decode(source));
}
