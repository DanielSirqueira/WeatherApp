import 'package:dartz/dartz.dart';
import 'package:weather/domain/entities/city_weather.dart';
import 'package:weather/domain/errors/error.dart';
import 'package:weather/domain/repositories/search_weather_repository.dart';

export 'search_weather_by_city.dart';

abstract class SearchWeatherByCity {
  Future<Either<SystemError, CityWeather>> call(String city);
}

class SearchWeatherByCityImpl implements SearchWeatherByCity {
  final SearchWeatherRepository repository;

  SearchWeatherByCityImpl(this.repository);

  @override
  Future<Either<SystemError, CityWeather>> call(String city) async {
    if (city.isEmpty) {
      return Left(InvalidTextError());
    }

    return repository.search(city);
  }
}
