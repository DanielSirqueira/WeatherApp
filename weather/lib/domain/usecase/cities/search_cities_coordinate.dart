import 'package:dartz/dartz.dart';
import 'package:weather/domain/entities/city.dart';
import 'package:weather/domain/errors/error.dart';
import 'package:weather/domain/repositories/search_city_repository.dart';

abstract class SearchCitiesCoordinate {
  Future<Either<SystemError, List<City>>> call(
      {required double latitude, required double longitude});
}

class SearchCitiesCoordinateImpl implements SearchCitiesCoordinate {
  final SearchCityRepository repository;

  SearchCitiesCoordinateImpl(this.repository);

  @override
  Future<Either<SystemError, List<City>>> call(
      {required double latitude, required double longitude}) async {
    return repository.getCitysCoordinate(
        latitude: latitude, longitude: longitude);
  }
}
