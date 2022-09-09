import 'dart:convert';

import 'package:test/test.dart';
import 'package:weather/infra/models/city_weather_model.dart';

import '../../utils/city_weather_json.dart';

void main() {
  test('Converter JSON para Object CityWeather', () async {
    var cityWeather = CityWeatherModel.fromMap(json.decode(city_weather_json));

    expect(true, cityWeather.currentConditions.isNotEmpty);
    expect(25, cityWeather.currentConditions[0].temp);
  });
}
