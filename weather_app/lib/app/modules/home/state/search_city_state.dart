import 'package:weather/domain/entities/city.dart';
import 'package:weather/domain/errors/error.dart';

abstract class SearchCityState {}

class SearchCityStart extends SearchCityState {}

class SearchCityLoading extends SearchCityState {}

class SearchCitySuccess extends SearchCityState {
  final List<City> citys;

  SearchCitySuccess(this.citys);
}

class SearchCityError extends SearchCityState {
  final SystemError error;

  SearchCityError(this.error);
}
