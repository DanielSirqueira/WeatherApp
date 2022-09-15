import 'package:uno/uno.dart';
import 'package:weather/domain/errors/error.dart';
import 'package:weather/infra/datasources/search_weather_datasource.dart';

export 'wttr_datasource.dart';

class WttrDatasource implements SearchWeatherDatasource {
  final Uno uno;

  WttrDatasource(this.uno);

  @override
  Future<Map<String, dynamic>> getSearch(String city) async {
    var response = await uno
        .get('https://wttr.in/${city.replaceAll(' ', '%20')}?format=j1');

    if (response.status == 200) {
      return response.data as Map<String, dynamic>;
    } else {
      throw DatasourceError(message: "Erro de conexão com o servidor.");
    }
    // var data = json.decode(weatherSalvadorJson);
    // return CityWeatherModel.fromMap(data);
  }
}
