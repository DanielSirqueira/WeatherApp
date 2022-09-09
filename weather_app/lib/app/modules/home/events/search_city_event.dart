abstract class SearchCityEvent {}

class SearchListCityEvent extends SearchCityEvent {
  final String query;

  SearchListCityEvent(this.query);
}
