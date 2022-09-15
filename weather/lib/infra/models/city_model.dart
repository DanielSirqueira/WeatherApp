// ignore_for_file: overridden_fields

import 'dart:convert';

import 'package:weather/domain/entities/city.dart';

class CityModel extends City {
  CityModel({
    required String name,
    required double latitude,
    required double longitude,
    required String country,
    required String state,
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
      name: map['name'],
      latitude: map['latitude']?.toDouble(),
      longitude: map['longitude']?.toDouble(),
      country: map['country'],
      state: map['state'],
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
