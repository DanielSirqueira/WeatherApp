import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/domain/usecase/cities/search_cities.dart';

import 'package:weather_app/app/modules/home/events/search_city_event.dart';
import 'package:weather_app/app/modules/home/state/search_city_state.dart';
import 'package:rxdart/rxdart.dart';

class SearchCityBloc extends Bloc<SearchCityEvent, SearchCityState> {
  SearchCities usecase;

  SearchCityBloc(this.usecase) : super(SearchCityStart()) {
    on<SearchListCityEvent>(
      (event, emit) => getListCity(event, emit),
      transformer: (events, mapper) {
        return events
            .debounceTime(const Duration(milliseconds: 800))
            .asyncExpand(mapper);
      },
    );
  }

  Future<void> getListCity(SearchListCityEvent event, Emitter emit) async {
    emit(SearchCityLoading());
    var result = await usecase(event.query);

    result.fold(
      (error) => emit(SearchCityError(error)),
      (citys) => emit(SearchCitySuccess(citys)),
    );
  }
}
