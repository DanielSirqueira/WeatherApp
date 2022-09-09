import 'dart:convert';

import 'package:test/test.dart';
import 'package:weather/infra/models/city_model.dart';

import '../../utils/city_json.dart';

void main() {
  test('Converter JSON para Object CityModel', () {
    var data = json.decode(citys_json);
    var citys = data.map((e) => CityModel.fromMap(e));

    expect(true, citys.isNotEmpty);
  });
}
