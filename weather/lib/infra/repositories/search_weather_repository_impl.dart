import 'package:weather/domain/errors/error.dart';
import 'package:weather/domain/entities/city_weather.dart';
import 'package:dartz/dartz.dart';
import 'package:weather/domain/repositories/search_weather_repository.dart';
import 'package:weather/infra/datasources/search_weather_datasource.dart';

export 'search_weather_repository_impl.dart';

class SearchWeatherRepositoryImpl implements SearchWeatherRepository {
  final SearchWeatherDatasource datasource;

  SearchWeatherRepositoryImpl(this.datasource);

  @override
  Future<Either<SystemError, CityWeather>> search(String city) async {
    try {
      final result = await datasource.getSearch(city);
      return Right(result);
    } on DatasourceError catch (e) {
      return Left(e);
    } catch (e) {
      return Left(DatasourceError());
    }
  }
}
