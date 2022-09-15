import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:weather/domain/entities/city_weather.dart';
import 'package:weather/domain/errors/error.dart';
import 'package:weather/domain/repositories/search_weather_repository.dart';
import 'package:weather/domain/usecase/weather/search_weather_by_city.dart';
import 'package:weather/infra/models/city_weather_model.dart';
import 'package:weather/utils/city_weather_json.dart';

import 'search_weather_by_city_test.mocks.dart';

@GenerateMocks([SearchWeatherRepository])
main() {
  final repository = MockSearchWeatherRepository();
  final usecase = SearchWeatherByCityImpl(repository);

  test('Deve retornar um objeto de CityWeather', () async {
    when(repository.search('Itaberaí')).thenAnswer((_) async =>
        Right(CityWeatherModel.fromMap(json.decode(city_weather_json))));

    final result = await usecase('Itaberaí');

    expect(result.fold(id, id), isA<CityWeather>());
  });

  test('Deve retornar um InvalidTextError caso o texto da cidade seja invalido',
      () async {
    when(repository.search('Itaberaí')).thenAnswer((_) async =>
        Right(CityWeatherModel.fromMap(json.decode(city_weather_json))));

    final result = await usecase('');
    expect(result.fold(id, id), isA<InvalidTextError>());
  });
}
