import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:weather/domain/entities/city.dart';
import 'package:weather/domain/errors/error.dart';
import 'package:weather/domain/repositories/search_city_repository.dart';
import 'package:weather/domain/usecase/search_city_usecase.dart';

import 'search_city_test.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<SearchCityRepository>(
      as: #MockSearchCityRepository, onMissingStub: OnMissingStub.returnDefault)
])
main() {
  final repository = MockSearchCityRepository();
  final usecase = SearchCityUsecaseImpl(repository);

  test('Deve retornar um objeto de CityWeather buscando pelo nome da cidade',
      () async {
    when(repository.getCitys('Itaberaí'))
        .thenAnswer((_) async => const Right(<City>[]));

    final result = await usecase.getCitys('Itaberaí');

    expect(result | [], isA<List<City>>());
  });

  test('Deve retornar um objeto de CityWeather buscando pela cordenada',
      () async {
    when(repository.getCitysCoordinate(
      latitude: 0,
      longitude: 0,
    )).thenAnswer((_) async => const Right(<City>[]));

    final result = await usecase.getCitysCoordinate(latitude: 0, longitude: 0);

    expect(result.fold(id, id), isA<List<City>>());
  });

  test('Deve retornar um InvalidTextError caso o texto da cidade seja invalido',
      () async {
    when(repository.getCitys('Itaberaí'))
        .thenAnswer((_) async => const Right(<City>[]));

    final result = await usecase.getCitys('');
    expect(result.fold(id, id), isA<InvalidTextError>());
  });
}
