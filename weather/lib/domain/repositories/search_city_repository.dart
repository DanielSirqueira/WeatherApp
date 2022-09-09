import 'package:dartz/dartz.dart';
import 'package:weather/domain/entities/city.dart';
import 'package:weather/domain/errors/error.dart';

abstract class SearchCityRepository {
  Future<Either<SystemError, List<City>>> getCitys(String city);

  Future<Either<SystemError, List<City>>> getCitysCoordinate(
      {required double latitude, required double longitude});
}
