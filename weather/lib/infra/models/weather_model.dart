// ignore_for_file: overridden_fields

import 'dart:convert';

import 'package:weather/domain/entities/weather.dart';
import 'package:weather/domain/entities/weather_hours.dart';
import 'package:weather/infra/models/weather_hours_model.dart';

class WeatherModel extends Weather {
  @override
  int avgTemp;
  @override
  int maxTemp;
  @override
  int minTemp;
  @override
  int uvIndex;
  @override
  DateTime date;
  @override
  List<WeatherHours> hourly;

  WeatherModel({
    required this.avgTemp,
    required this.maxTemp,
    required this.minTemp,
    required this.uvIndex,
    required this.date,
    required this.hourly,
  }) : super(
          avgTemp: avgTemp,
          maxTemp: maxTemp,
          minTemp: minTemp,
          uvIndex: uvIndex,
          date: date,
          hourly: hourly,
        );

  Map<String, dynamic> toMap() {
    return {
      'avgTemp': avgTemp,
      'maxTemp': maxTemp,
      'minTemp': minTemp,
      'uvIndex': uvIndex,
      'date': date.toIso8601String(),
      'hourly': hourly.map((x) => (x as WeatherHoursModel).toMap()).toList(),
    };
  }

  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    return WeatherModel(
      avgTemp: map['avgtempC']?.isNotEmpty ? int.parse(map['avgtempC']) : 0,
      maxTemp: map['maxtempC']?.isNotEmpty ? int.parse(map['maxtempC']) : 0,
      minTemp: map['mintempC']?.isNotEmpty ? int.parse(map['mintempC']) : 0,
      uvIndex: map['uvIndex']?.isNotEmpty ? int.parse(map['uvIndex']) : 0,
      date: DateTime.parse(map['date']),
      hourly: List<WeatherHours>.from(
          map['hourly']?.map((x) => WeatherHoursModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherModel.fromJson(String source) =>
      WeatherModel.fromMap(json.decode(source));
}
