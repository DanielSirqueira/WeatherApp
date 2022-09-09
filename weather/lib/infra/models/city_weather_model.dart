// ignore_for_file: overridden_fields

import 'dart:convert';

import 'package:weather/domain/entities/city_weather.dart';
import 'package:weather/domain/entities/current_weather_condition.dart';
import 'package:weather/domain/entities/weather.dart';
import 'package:weather/infra/models/current_weather_condition_model.dart';
import 'package:weather/infra/models/weather_model.dart';

class CityWeatherModel extends CityWeather {
  @override
  List<CurrentWeatherCondition> currentConditions;
  @override
  List<Weather> weather;

  CityWeatherModel({
    required this.currentConditions,
    required this.weather,
  }) : super(
          currentConditions: currentConditions,
          weather: weather,
        );

  Map<String, dynamic> toMap() {
    return {
      'current_condition': currentConditions
          .map((x) => (x as CurrentWeatherConditionModel).toMap())
          .toList(),
      'weather': weather.map((x) => (x as WeatherModel).toMap()).toList(),
    };
  }

  factory CityWeatherModel.fromMap(Map<String, dynamic> map) {
    return CityWeatherModel(
      currentConditions: List<CurrentWeatherCondition>.from(
          map['current_condition']
              ?.map((x) => CurrentWeatherConditionModel.fromMap(x))),
      weather: List<Weather>.from(
          map['weather']?.map((x) => WeatherModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory CityWeatherModel.fromJson(String source) =>
      CityWeatherModel.fromMap(json.decode(source));
}
