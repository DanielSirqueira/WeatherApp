export 'search_weather_datasource.dart';

abstract class SearchWeatherDatasource {
  Future<Map> getSearch(String city);
}
