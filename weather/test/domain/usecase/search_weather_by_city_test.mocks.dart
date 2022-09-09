// Mocks generated by Mockito 5.3.0 from annotations
// in weather/test/domain/usecase/search_weather_by_city_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:weather/domain/entities/city_weather.dart' as _i6;
import 'package:weather/domain/errors/error.dart' as _i5;
import 'package:weather/domain/repositories/search_weather_repository.dart'
    as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

/// A class which mocks [SearchWeatherRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockSearchWeatherRepository extends _i1.Mock
    implements _i3.SearchWeatherRepository {
  MockSearchWeatherRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.SystemError, _i6.CityWeather>> search(
          String? city) =>
      (super.noSuchMethod(Invocation.method(#search, [city]),
          returnValue:
              _i4.Future<_i2.Either<_i5.SystemError, _i6.CityWeather>>.value(
                  _FakeEither_0<_i5.SystemError, _i6.CityWeather>(
                      this, Invocation.method(#search, [city])))) as _i4
          .Future<_i2.Either<_i5.SystemError, _i6.CityWeather>>);
}
