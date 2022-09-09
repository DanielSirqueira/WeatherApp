import 'dart:convert';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:uno/uno.dart';
import 'package:weather/domain/errors/error.dart';
import 'package:test/test.dart';
import 'package:weather/external/datasources/wttr_datasource.dart';

import '../utils/city_weather_json.dart';
import 'wttr_datasource_test.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<Uno>(as: #MockUno, onMissingStub: OnMissingStub.returnDefault),
  MockSpec<Request>(
      as: #MockRequest, onMissingStub: OnMissingStub.returnDefault),
])
main() {
  final uno = MockUno();
  final request = MockRequest();
  final datasource = WttrDatasource(uno);

  test('Deve retornar um objeto de CityMeather', () async {
    when(uno.get('https://wttr.in/Itaberaí?format=j1')).thenAnswer((_) async =>
        Response(
            data: json.decode(city_weather_json),
            status: 200,
            request: request,
            headers: {}));

    final result = datasource.getSearch('Itaberaí');
    expect(result, completes);
  });

  test('Deve retornar um DatasourceError caso o status for diferente de 200',
      () async {
    when(uno.get('https://wttr.in/Itaberaí?format=j1')).thenAnswer((_) async =>
        Response(data: null, status: 404, request: request, headers: {}));

    final result = datasource.getSearch('Itaberaí');
    expect(result, throwsA(isA<DatasourceError>()));
  });

  test('Deve retorna um Exception se tiver um erro no uno', () async {
    when(uno.get(any)).thenThrow(Exception());

    final result = datasource.getSearch('itaberaí');
    expect(result, throwsA(isA<Exception>()));
  });
}
