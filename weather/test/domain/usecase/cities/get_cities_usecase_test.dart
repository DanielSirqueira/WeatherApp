import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:weather/domain/entities/city.dart';
import 'package:weather/domain/errors/error.dart';
import 'package:weather/domain/repositories/search_city_repository.dart';
import 'package:weather/domain/usecase/cities/search_cities.dart';

import 'get_cities_usecase_test.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<SearchCityRepository>(
      as: #MockSearchCityRepository, onMissingStub: OnMissingStub.returnDefault)
])
void main() {
  final repository = MockSearchCityRepository();
  final SearchCities usecase = SearchCitiesImpl(repository);

  test('Deve retornar um objeto de CityWeather buscando pelo nome da cidade',
      () async {
    when(repository.getCitys('Itaberaí'))
        .thenAnswer((_) async => const Right(<City>[]));

    final result = await usecase('Itaberaí');

    expect(result | [], isA<List<City>>());
  });

  test('Deve retornar um InvalidTextError caso o texto da cidade seja invalido',
      () async {
    when(repository.getCitys('Itaberaí'))
        .thenAnswer((_) async => const Right(<City>[]));

    final result = await usecase('');
    expect(result.fold(id, id), isA<InvalidTextError>());
  });
}
