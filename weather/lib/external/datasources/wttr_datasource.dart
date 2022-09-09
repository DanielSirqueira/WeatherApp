import 'dart:convert';

import 'package:uno/uno.dart';
import 'package:weather/domain/entities/city_weather.dart';
import 'package:weather/domain/errors/error.dart';
import 'package:weather/infra/datasources/search_weather_datasource.dart';
import 'package:weather/infra/models/city_weather_model.dart';
import 'package:weather/utils/city_weather_json.dart';

export 'wttr_datasource.dart';

class WttrDatasource implements SearchWeatherDatasource {
  final Uno uno;

  WttrDatasource(this.uno);

  @override
  Future<CityWeather> getSearch(String city) async {
    var result = await uno
        .get('https://wttr.in/${city.replaceAll(' ', '%20')}?format=j1');

    if (result.status == 200) {
      return CityWeatherModel.fromMap(result.data as Map<String, dynamic>);
    } else {
      throw DatasourceError(message: "Erro de conexão com o servidor.");
    }
    // var data = json.decode(weatherSalvadorJson);
    // return CityWeatherModel.fromMap(data);
  }
}
