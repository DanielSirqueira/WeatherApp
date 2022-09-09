import 'package:weather/domain/entities/current_weather_condition.dart';
import 'package:weather/domain/entities/weather.dart';

export 'city_weather.dart';

class CityWeather {
  List<CurrentWeatherCondition> currentConditions;
  List<Weather> weather;

  CityWeather({
    required this.currentConditions,
    required this.weather,
  });
}
