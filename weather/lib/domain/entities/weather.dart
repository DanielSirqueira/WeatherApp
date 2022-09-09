import 'package:weather/domain/entities/weather_hours.dart';

export 'weather.dart';

class Weather {
  int avgTemp;
  int maxTemp;
  int minTemp;
  int uvIndex;
  DateTime date;
  List<WeatherHours> hourly;

  Weather({
    required this.avgTemp,
    required this.maxTemp,
    required this.minTemp,
    required this.uvIndex,
    required this.date,
    required this.hourly,
  });
}
