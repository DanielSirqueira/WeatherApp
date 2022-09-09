import 'package:uno/uno.dart';
import 'package:weather/domain/entities/city.dart';
import 'package:weather/domain/errors/error.dart';
import 'package:weather/infra/datasources/search_city_datasource.dart';
import 'package:weather/infra/models/city_model.dart';

class NijaCityDatasource implements SearchCityDatasource {
  final Uno uno;

  NijaCityDatasource(this.uno);

  final String key = 'vMC7m6LneVyGyzsy/qeIlQ==9RsCU1wRYibYb8Is';

  @override
  Future<List<City>> getCitysCoordinate(
      {required double latitude, required double longitude}) async {
    var result = await uno.get('https://api.api-ninjas.com/v1/city', params: {
      'min_lat': '$latitude',
      'min_lon': '$longitude',
      'country': 'BR',
    }, headers: {
      'X-Api-Key': key,
    });

    if (result.status == 200) {
      var list =
          (result.data as List).map((e) => CityModel.fromMap(e)).toList();
      return list;
    } else {
      throw DatasourceError(message: "Erro de conexão com o servidor.");
    }
  }

  @override
  Future<List<City>> getCitys(String city) async {
    var result =
        await uno.get('https://api.api-ninjas.com/v1/geocoding', params: {
      'city': city,
      'country': 'BR',
    }, headers: {
      'X-Api-Key': key,
    });

    if (result.status == 200) {
      var list =
          (result.data as List).map((e) => CityModel.fromMap(e)).toList();
      return list;
    } else {
      throw DatasourceError(message: "Erro de conexão com o servidor.");
    }
  }
}
