import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:weather/domain/entities/city_weather.dart';
import 'package:weather/domain/errors/error.dart';
import 'package:weather/infra/datasources/search_weather_datasource.dart';
import 'package:weather/infra/models/city_weather_model.dart';
import 'package:weather/infra/repositories/search_weather_repository_impl.dart';

import '../../utils/city_weather_json.dart';
import 'search_weather_repository_impl_test.mocks.dart';

@GenerateMocks([SearchWeatherDatasource])
void main() {
  final datasource = MockSearchWeatherDatasource();
  final repository = SearchWeatherRepositoryImpl(datasource);

  test('Deve retornar um InvalidTextError caso o texto da cidade seja invalido',
      () async {
    when(repository.search('Itaberaí')).thenAnswer((_) async =>
        Right(CityWeatherModel.fromMap(json.decode(city_weather_json))));

    final result = await repository.search('');
    expect(result.fold(id, id), isA<DatasourceError>());
  });

  test('Deve retornar um objeto de CityWeather', () async {
    when(datasource.getSearch('Itaberaí'))
        .thenAnswer((_) async => json.decode(city_weather_json));

    final result = await repository.search('Itaberaí');

    expect(result.fold(id, id), isA<CityWeather>());
  });
}
