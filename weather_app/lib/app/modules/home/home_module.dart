import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather/domain/usecase/search_city_usecase.dart';
import 'package:weather/domain/usecase/search_weather_by_city.dart';
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
    Bind((i) => SearchCityUsecaseImpl(i())),
    Bind.singleton((i) => SearchWeatherBloc(usecase: i(), cityUsecase: i())),
    Bind.factory((i) => SearchCityBloc(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (context, args) => const HomePage()),
    ChildRoute('/search-city',
        child: (context, args) => const SearchCityPage()),
  ];
}
