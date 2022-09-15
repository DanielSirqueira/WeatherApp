import 'package:dartz/dartz.dart';
import 'package:weather/domain/entities/city.dart';
import 'package:weather/domain/errors/error.dart';
import 'package:weather/domain/repositories/search_city_repository.dart';

abstract class SearchCities {
  Future<Either<SystemError, List<City>>> call(String city);
}

class SearchCitiesImpl implements SearchCities {
  final SearchCityRepository repository;

  SearchCitiesImpl(this.repository);

  @override
  Future<Either<SystemError, List<City>>> call(String city) async {
    if (city.isEmpty) {
      return Left(InvalidTextError('Cidade é de preechimento obrigatorio.'));
    }

    return this.repository.getCitys(city);
  }
}
