import 'package:uno/uno.dart';
import 'package:weather/domain/errors/error.dart';
import 'package:weather/infra/datasources/search_city_datasource.dart';

class NijaCityDatasource implements SearchCityDatasource {
  final Uno uno;

  NijaCityDatasource(this.uno);

  final String key = 'XIqZGf8q/v9THl9MOjPSJA==vNzc2GALbC65kmEA';

  @override
  Future<List<dynamic>> getCitysCoordinate(
      {required double latitude, required double longitude}) async {
    var response = await uno.get('https://api.api-ninjas.com/v1/city', params: {
      'max_lat': '$latitude',
      'max_lon': '$longitude',
      'country': 'BR',
    }, headers: {
      'X-Api-Key': key,
    });

    if (response.status == 200) {
      return response.data;
    } else {
      throw DatasourceError(message: "Erro de conexão com o servidor.");
    }
  }

  @override
  Future<List<dynamic>> getCitys(String city) async {
    var response =
        await uno.get('https://api.api-ninjas.com/v1/geocoding', params: {
      'city': city,
      'country': 'BR',
    }, headers: {
      'X-Api-Key': key,
    });

    if (response.status == 200) {
      return response.data;
    } else {
      throw DatasourceError(message: "Erro de conexão com o servidor.");
    }
  }
}
