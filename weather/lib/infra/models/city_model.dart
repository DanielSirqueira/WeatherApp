// ignore_for_file: overridden_fields

import 'dart:convert';

import 'package:weather/domain/entities/city.dart';

class CityModel extends City {
  @override
  String name;
  @override
  double latitude;
  @override
  double longitude;
  @override
  String country;
  @override
  String state;

  CityModel({
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.country,
    required this.state,
  }) : super(
          name: name,
          latitude: latitude,
          longitude: longitude,
          country: country,
          state: state,
        );

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'latitude': latitude,
      'longitude': longitude,
      'country': country,
      'state': state,
    };
  }

  factory CityModel.fromMap(Map<String, dynamic> map) {
    return CityModel(
      name: map['name'] ?? '',
      latitude: map['latitude']?.toDouble() ?? 0.0,
      longitude: map['longitude']?.toDouble() ?? 0.0,
      country: map['country'] ?? '',
      state: map['state'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CityModel.fromJson(String source) =>
      CityModel.fromMap(json.decode(source));

  @override
  String toString() {
    return '$name, $state';
  }
}
