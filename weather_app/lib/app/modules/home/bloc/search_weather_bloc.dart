import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/domain/entities/city.dart';

import 'package:weather/domain/usecase/search_city_usecase.dart';
import 'package:weather/domain/usecase/search_weather_by_city.dart';
import 'package:weather_app/app/modules/home/events/search_weather_event.dart';
import 'package:weather_app/app/modules/home/state/weather_state.dart';

class SearchWeatherBloc extends Bloc<WeatherEvent, SearchWeatherState> {
  final SearchWeatherByCity usecase;
  final SearchCityUsecase cityUsecase;

  SearchWeatherBloc({
    required this.usecase,
    required this.cityUsecase,
  }) : super(SearchWeatherLoadgin()) {
    on<GetGeolocationWeatherEvent>(
        (event, emit) => getGeolocationWeather(event, emit));
    on<GetWeatherEvent>((event, emit) => getWeather(event, emit));
  }

  Future<void> getGeolocationWeather(
      GetGeolocationWeatherEvent event, Emitter emit) async {
    emit(SearchWeatherLoadgin());
    var position = await _determinePosition();

    if (position != null) {
      var result = await cityUsecase.getCitysCoordinate(
          latitude: position.latitude, longitude: position.longitude);

      result.fold(
        (l) async {
          var city = await Modular.to.pushNamed<City?>('/search-city');

          if (city != null) {
            add(GetWeatherEvent(city));
          } else {
            getCapitalWeather();
          }
        },
        (city) {
          if (city.isNotEmpty) {
            add(GetWeatherEvent(city[0]));
          } else {
            getCapitalWeather();
          }
        },
      );
    }
  }

  Future<void> getWeather(GetWeatherEvent event, Emitter emit) async {
    emit(SearchWeatherLoadgin());

    final city = event.city;
    final result = await usecase(city.name);

    result.fold(
      (error) => emit(SearchWeatherError(error)),
      (response) => emit(SearchWeatherSuccess(data: response, city: city)),
    );
  }

  getCapitalWeather() {
    add(GetWeatherEvent(City(
      name: 'Brasília',
      latitude: -15.7934036,
      longitude: -47.8823172,
      country: 'BR',
      state: 'Federal District',
    )));
  }

  Future<Position?> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return null;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return null;
    }

    return await Geolocator.getCurrentPosition(
        forceAndroidLocationManager: true);
  }
}
