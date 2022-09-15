import 'dart:convert';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:uno/uno.dart';
import 'package:weather/domain/entities/city.dart';
import 'package:weather/domain/errors/error.dart';
import 'package:test/test.dart';
import 'package:weather/external/datasources/nija_city_datasource.dart';

import '../utils/city_json.dart';
import 'nija_city_datasource_test.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<Uno>(as: #MockUno, onMissingStub: OnMissingStub.returnDefault),
  MockSpec<Request>(
      as: #MockRequest, onMissingStub: OnMissingStub.returnDefault),
])
main() {
  final uno = MockUno();
  final request = MockRequest();
  final datasource = NijaCityDatasource(uno);

  final String key = 'XIqZGf8q/v9THl9MOjPSJA==vNzc2GALbC65kmEA';

  test('Deve retornar uma lista do objeto de City pelas cordenadas', () async {
    when(uno.get('https://api.api-ninjas.com/v1/city', params: {
      'max_lat': '0.0',
      'max_lon': '0.0',
      'country': 'BR',
    }, headers: {
      'X-Api-Key': key,
    })).thenAnswer((_) async => Response(
        data: json.decode(citys_json),
        status: 200,
        request: request,
        headers: {}));

    final result = datasource.getCitysCoordinate(latitude: 0, longitude: 0);
    expect(result, completes);
  });

  test('Deve retornar um objeto de City', () async {
    when(uno.get('https://api.api-ninjas.com/v1/geocoding', params: {
      'city': 'Itaberaí',
      'country': 'BR',
    }, headers: {
      'X-Api-Key': key,
    })).thenAnswer((_) async => Response(
        data: json.decode(citys_json),
        status: 200,
        request: request,
        headers: {}));

    final result = await datasource.getCitys('Itaberaí');
    expect(result, isA<List<dynamic>>());
  });

  test('Deve retornar um DatasourceError caso o status for diferente de 200',
      () async {
    when(uno.get('https://api.api-ninjas.com/v1/geocoding', params: {
      'city': 'Itaberaí',
      'country': 'BR',
    }, headers: {
      'X-Api-Key': key,
    })).thenAnswer((_) async =>
        Response(data: null, status: 404, request: request, headers: {}));

    final result = datasource.getCitys('Itaberaí');
    expect(result, throwsA(isA<DatasourceError>()));
  });
}
