// ignore_for_file: overridden_fields

import 'package:weather/domain/entities/weather.dart';
import 'package:weather/domain/entities/weather_hours.dart';
import 'package:weather/infra/models/weather_hours_model.dart';

class WeatherModel extends Weather {
  WeatherModel({
    required int avgTemp,
    required int maxTemp,
    required int minTemp,
    required int uvIndex,
    required DateTime date,
    required List<WeatherHours> hourly,
  }) : super(
          avgTemp: avgTemp,
          maxTemp: maxTemp,
          minTemp: minTemp,
          uvIndex: uvIndex,
          date: date,
          hourly: hourly,
        );

  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    return WeatherModel(
      avgTemp: int.parse(map['avgtempC']),
      maxTemp: int.parse(map['maxtempC']),
      minTemp: int.parse(map['mintempC']),
      uvIndex: int.parse(map['uvIndex']),
      date: DateTime.parse(map['date']),
      hourly: List<WeatherHours>.from(
          map['hourly']?.map((hours) => WeatherHoursModel.fromMap(hours))),
    );
  }
}
