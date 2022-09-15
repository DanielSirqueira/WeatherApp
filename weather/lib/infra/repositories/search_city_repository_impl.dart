import 'package:weather/domain/errors/error.dart';
import 'package:weather/domain/entities/city.dart';
import 'package:dartz/dartz.dart';
import 'package:weather/domain/repositories/search_city_repository.dart';
import 'package:weather/infra/datasources/search_city_datasource.dart';
import 'package:weather/infra/models/city_model.dart';

class SearchCityRepositoryImpl implements SearchCityRepository {
  final SearchCityDatasource datasource;

  SearchCityRepositoryImpl(this.datasource);

  @override
  Future<Either<SystemError, List<City>>> getCitysCoordinate(
      {required double latitude, required double longitude}) async {
    try {
      final map = await datasource.getCitysCoordinate(
          latitude: latitude, longitude: longitude);
      final cities = (map as List).map((e) => CityModel.fromMap(e)).toList();
      return Right(cities);
    } on DatasourceError catch (e) {
      return Left(e);
    } catch (e) {
      return Left(DatasourceError());
    }
  }

  @override
  Future<Either<SystemError, List<City>>> getCitys(String city) async {
    try {
      final map = await datasource.getCitys(city);

      final cities = (map as List).map((e) => CityModel.fromMap(e)).toList();
      return Right(cities);
    } on DatasourceError catch (e) {
      return Left(e);
    } catch (e) {
      return Left(DatasourceError());
    }
  }
}
