// ignore_for_file: overridden_fields

import 'dart:convert';

import 'package:weather/domain/entities/types/type_weather.dart';
import 'package:weather/domain/entities/weather_hours.dart';

class WeatherHoursModel extends WeatherHours {
  @override
  int time;
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
  @override
  double chanceOfFog;
  @override
  double chanceOfFrost;
  @override
  double chanceOfHighTemp;
  @override
  double chanceOfOvercast;
  @override
  double chanceOfRain;
  @override
  double chanceOfDry;
  @override
  double chanceOfSnow;
  @override
  double chanceOfSunshine;
  @override
  double chanceOfThunder;
  @override
  double chanceOfWindy;

  WeatherHoursModel({
    required this.time,
    required this.feelsLike,
    required this.cloudCover,
    required this.humidity,
    required this.pressure,
    required this.temp,
    required this.uvIndex,
    required this.typeWeather,
    required this.windSpeedKm,
    required this.chanceOfFog,
    required this.chanceOfFrost,
    required this.chanceOfHighTemp,
    required this.chanceOfOvercast,
    required this.chanceOfRain,
    required this.chanceOfDry,
    required this.chanceOfSnow,
    required this.chanceOfSunshine,
    required this.chanceOfThunder,
    required this.chanceOfWindy,
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

  Map<String, dynamic> toMap() {
    return {
      'time': time,
      'FeelsLikeC': feelsLike,
      'cloudcover': cloudCover,
      'humidity': humidity,
      'pressure': pressure,
      'tempC': temp,
      'uvIndex': uvIndex,
      'weatherCode': typeWeather,
      'windspeedKmph': windSpeedKm,
      'chanceoffog': chanceOfFog,
      'chanceoffrost': chanceOfFrost,
      'chanceofhightemp': chanceOfHighTemp,
      'chanceofovercast': chanceOfOvercast,
      'chanceofrain': chanceOfRain,
      'chanceofremdry': chanceOfDry,
      'chanceofsnow': chanceOfSnow,
      'chanceofsunshine': chanceOfSunshine,
      'chanceofthunder': chanceOfThunder,
      'chanceofwindy': chanceOfWindy,
    };
  }

  factory WeatherHoursModel.fromMap(Map<String, dynamic> map) {
    return WeatherHoursModel(
      time: map['time']?.isNotEmpty ? int.parse(map['time']) : 0,
      feelsLike:
          map['FeelsLikeC']?.isNotEmpty ? int.parse(map['FeelsLikeC']) : 0,
      cloudCover:
          map['cloudcover']?.isNotEmpty ? int.parse(map['cloudcover']) : 0,
      humidity: map['humidity']?.isNotEmpty ? int.parse(map['humidity']) : 0,
      pressure: map['pressure']?.isNotEmpty ? int.parse(map['pressure']) : 0,
      temp: map['tempC']?.isNotEmpty ? int.parse(map['tempC']) : 0,
      uvIndex: map['uvIndex']?.isNotEmpty ? int.parse(map['uvIndex']) : 0,
      typeWeather: map['weatherCode']?.isNotEmpty
          ? TypeWeather(int.parse(map['weatherCode']))
          : TypeWeather(0),
      windSpeedKm: map['windspeedKmph']?.isNotEmpty
          ? int.parse(map['windspeedKmph'])
          : 0,
      chanceOfFog:
          map['chanceoffog']?.isNotEmpty ? double.parse(map['chanceoffog']) : 0,
      chanceOfFrost: map['chanceoffrost']?.isNotEmpty
          ? double.parse(map['chanceoffrost'])
          : 0,
      chanceOfHighTemp: map['chanceofhightemp']?.isNotEmpty
          ? double.parse(map['chanceofhightemp'])
          : 0,
      chanceOfOvercast: map['chanceofovercast']?.isNotEmpty
          ? double.parse(map['chanceofovercast'])
          : 0,
      chanceOfRain: map['chanceofrain']?.isNotEmpty
          ? double.parse(map['chanceofrain'])
          : 0,
      chanceOfDry: map['chanceofremdry']?.isNotEmpty
          ? double.parse(map['chanceofremdry'])
          : 0,
      chanceOfSnow: map['chanceofsnow']?.isNotEmpty
          ? double.parse(map['chanceofsnow'])
          : 0,
      chanceOfSunshine: map['chanceofsunshine']?.isNotEmpty
          ? double.parse(map['chanceofsunshine'])
          : 0,
      chanceOfThunder: map['chanceofthunder']?.isNotEmpty
          ? double.parse(map['chanceofthunder'])
          : 0,
      chanceOfWindy: map['chanceofwindy']?.isNotEmpty
          ? double.parse(map['chanceofwindy'])
          : 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherHoursModel.fromJson(String source) =>
      WeatherHoursModel.fromMap(json.decode(source));
}
