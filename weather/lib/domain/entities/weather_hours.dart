import 'package:weather/domain/entities/types/type_weather.dart';
import 'package:weather/infra/models/weather_chance_model.dart';

export 'weather_hours.dart';

class WeatherHours {
  int time;
  int feelsLike;
  int cloudCover;
  int humidity;
  int pressure;
  int temp;
  int uvIndex;
  TypeWeather typeWeather;
  int windSpeedKm;
  double chanceOfFog;
  double chanceOfFrost;
  double chanceOfHighTemp;
  double chanceOfOvercast;
  double chanceOfRain;
  double chanceOfDry;
  double chanceOfSnow;
  double chanceOfSunshine;
  double chanceOfThunder;
  double chanceOfWindy;

  WeatherHours({
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
  });
}
