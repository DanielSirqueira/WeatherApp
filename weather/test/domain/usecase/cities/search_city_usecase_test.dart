import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';
import 'package:weather/domain/entities/city.dart';
import 'package:weather/domain/repositories/search_city_repository.dart';
import 'package:weather/domain/usecase/cities/search_cities_coordinate.dart';

import 'search_city_usecase_test.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<SearchCityRepository>(
      as: #MockSearchCityRepository, onMissingStub: OnMissingStub.returnDefault)
])
void main() {
  final repository = MockSearchCityRepository();
  final SearchCitiesCoordinate usecase = SearchCitiesCoordinateImpl(repository);

  test('Deve retornar um objeto de CityWeather buscando pela cordenada',
      () async {
    when(repository.getCitysCoordinate(
      latitude: 0,
      longitude: 0,
    )).thenAnswer((_) async => const Right(<City>[]));

    final result = await usecase(latitude: 0, longitude: 0);

    expect(result.fold(id, id), isA<List<City>>());
  });
}
