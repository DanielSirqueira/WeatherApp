import 'package:dartz/dartz.dart';
import 'package:weather/domain/entities/city.dart';
import 'package:weather/domain/errors/error.dart';
import 'package:weather/domain/repositories/search_city_repository.dart';

abstract class SearchCityUsecase {
  Future<Either<SystemError, List<City>>> getCitys(String city);

  Future<Either<SystemError, List<City>>> getCitysCoordinate(
      {required double latitude, required double longitude});
}

class SearchCityUsecaseImpl implements SearchCityUsecase {
  final SearchCityRepository repository;

  SearchCityUsecaseImpl(this.repository);

  @override
  Future<Either<SystemError, List<City>>> getCitysCoordinate(
      {required double latitude, required double longitude}) async {
    return repository.getCitysCoordinate(
        latitude: latitude, longitude: longitude);
  }

  @override
  Future<Either<SystemError, List<City>>> getCitys(String city) async {
    if (city.isEmpty) {
      return Left(InvalidTextError());
    }

    return repository.getCitys(city);
  }
}
