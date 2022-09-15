// ignore_for_file: overridden_fields

import 'dart:convert';

import 'package:weather/domain/entities/types/type_weather.dart';
import 'package:weather/domain/entities/weather_hours.dart';

class WeatherHoursModel extends WeatherHours {
  WeatherHoursModel({
    required int time,
    required int feelsLike,
    required int cloudCover,
    required int humidity,
    required int pressure,
    required int temp,
    required int uvIndex,
    required TypeWeather typeWeather,
    required int windSpeedKm,
    required double chanceOfFog,
    required double chanceOfFrost,
    required double chanceOfHighTemp,
    required double chanceOfOvercast,
    required double chanceOfRain,
    required double chanceOfDry,
    required double chanceOfSnow,
    required double chanceOfSunshine,
    required double chanceOfThunder,
    required double chanceOfWindy,
  }) : super(
          time: time,
          feelsLike: feelsLike,
          cloudCover: cloudCover,
          humidity: humidity,
          pressure: pressure,
          temp: temp,
          uvIndex: uvIndex,
          typeWeather: typeWeather,
          windSpeedKm: windSpeedKm,
          chanceOfFog: chanceOfFog,
          chanceOfFrost: chanceOfFrost,
          chanceOfHighTemp: chanceOfHighTemp,
          chanceOfOvercast: chanceOfOvercast,
          chanceOfRain: chanceOfRain,
          chanceOfDry: chanceOfDry,
          chanceOfSnow: chanceOfSnow,
          chanceOfSunshine: chanceOfSunshine,
          chanceOfThunder: chanceOfThunder,
          chanceOfWindy: chanceOfWindy,
        );

  factory WeatherHoursModel.fromMap(Map<String, dynamic> map) {
    return WeatherHoursModel(
      time: int.parse(map['time']),
      feelsLike: int.parse(map['FeelsLikeC']),
      cloudCover: int.parse(map['cloudcover']),
      humidity: int.parse(map['humidity']),
      pressure: int.parse(map['pressure']),
      temp: int.parse(map['tempC']),
      uvIndex: int.parse(map['uvIndex']),
      typeWeather: TypeWeather(int.parse(map['weatherCode'])),
      windSpeedKm: int.parse(map['windspeedKmph']),
      chanceOfFog: double.parse(map['chanceoffog']),
      chanceOfFrost: double.parse(map['chanceoffrost']),
      chanceOfHighTemp: double.parse(map['chanceofhightemp']),
      chanceOfOvercast: double.parse(map['chanceofovercast']),
      chanceOfRain: double.parse(map['chanceofrain']),
      chanceOfDry: double.parse(map['chanceofremdry']),
      chanceOfSnow: double.parse(map['chanceofsnow']),
      chanceOfSunshine: double.parse(map['chanceofsunshine']),
      chanceOfThunder: double.parse(map['chanceofthunder']),
      chanceOfWindy: double.parse(map['chanceofwindy']),
    );
  }
}
