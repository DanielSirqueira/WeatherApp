import 'package:weather/domain/entities/city_weather.dart';

export 'search_weather_datasource.dart';

abstract class SearchWeatherDatasource {
  Future<CityWeather> getSearch(String city);
}
