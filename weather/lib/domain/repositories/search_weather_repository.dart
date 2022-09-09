import 'package:dartz/dartz.dart';
import 'package:weather/domain/entities/city_weather.dart';
import 'package:weather/domain/errors/error.dart';

export 'search_weather_repository.dart';

abstract class SearchWeatherRepository {
  Future<Either<SystemError, CityWeather>> search(String city);
}
