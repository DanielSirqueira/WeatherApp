// ignore_for_file: overridden_fields

import 'dart:convert';

import 'package:weather/domain/entities/city_weather.dart';
import 'package:weather/domain/entities/current_weather_condition.dart';
import 'package:weather/domain/entities/weather.dart';
import 'package:weather/infra/models/current_weather_condition_model.dart';
import 'package:weather/infra/models/weather_model.dart';

class CityWeatherModel extends CityWeather {
  CityWeatherModel({
    required List<CurrentWeatherCondition> currentConditions,
    required List<Weather> weather,
  }) : super(
          currentConditions: currentConditions,
          weather: weather,
        );

  factory CityWeatherModel.fromMap(Map<String, dynamic> map) {
    return CityWeatherModel(
      currentConditions: List<CurrentWeatherCondition>.from(
          map['current_condition']?.map((currentCondition) =>
              CurrentWeatherConditionModel.fromMap(currentCondition))),
      weather: List<Weather>.from(
          map['weather']?.map((weather) => WeatherModel.fromMap(weather))),
    );
  }
}
