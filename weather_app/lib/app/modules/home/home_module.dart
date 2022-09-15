import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather/domain/entities/city.dart';
import 'package:weather/domain/usecase/cities/search_cities.dart';
import 'package:weather/domain/usecase/cities/search_cities_coordinate.dart';
import 'package:weather/domain/usecase/weather/search_weather_by_city.dart';
import 'package:weather/external/datasources/nija_city_datasource.dart';
import 'package:weather/external/datasources/wttr_datasource.dart';
import 'package:weather/infra/repositories/search_city_repository_impl.dart';
import 'package:weather/infra/repositories/search_weather_repository_impl.dart';
import 'package:weather_app/app/modules/home/bloc/search_city_bloc.dart';
import 'package:weather_app/app/modules/home/bloc/search_weather_bloc.dart';
import 'package:weather_app/app/modules/home/pages/home_page.dart';
import 'package:weather_app/app/modules/home/pages/search_city_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => WttrDatasource(i())),
    Bind((i) => SearchWeatherRepositoryImpl(i())),
    Bind((i) => SearchWeatherByCityImpl(i())),
    Bind((i) => NijaCityDatasource(i())),
    Bind((i) => SearchCityRepositoryImpl(i())),
    Bind((i) => SearchCitiesImpl(i())),
    Bind((i) => SearchCitiesCoordinateImpl(i())),
    Bind.singleton((i) => SearchWeatherBloc(
          usecase: i(),
          cityCoordinateUsecase: i(),
        )),
    Bind.singleton((i) => SearchCityBloc(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (context, args) => const HomePage()),
    ChildRoute('/search-city',
        child: (context, args) => const SearchCityPage()),
  ];
}
