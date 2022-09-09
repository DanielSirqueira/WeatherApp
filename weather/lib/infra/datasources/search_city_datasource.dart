import 'package:weather/domain/entities/city.dart';

abstract class SearchCityDatasource {
  Future<List<City>> getCitys(String city);

  Future<List<City>> getCitysCoordinate(
      {required double latitude, required double longitude});
}
