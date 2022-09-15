abstract class SearchCityDatasource {
  Future<List<dynamic>> getCitys(String city);

  Future<List<dynamic>> getCitysCoordinate(
      {required double latitude, required double longitude});
}
