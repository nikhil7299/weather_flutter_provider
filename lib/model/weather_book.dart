import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:weather/model/weather_model.dart';

class WeatherBook extends ValueNotifier<List<WeatherSearchItem>> {
  WeatherBook._sharedInstance() : super([]);

  static final WeatherBook _shared = WeatherBook._sharedInstance();

  factory WeatherBook() => _shared;

  int get length => value.length;

  void add({required WeatherSearchItem weatherSearchItem}) {
    final weathers = value;
    weathers.add(weatherSearchItem);
    notifyListeners();
  }

  void remove({required WeatherSearchItem weatherSearchItem}) {
    final weathers = value;
    if (weathers.contains(weatherSearchItem)) {
      weathers.remove(weatherSearchItem);
      notifyListeners();
    }
  }

  WeatherSearchItem? weatherSearchItem({required int atIndex}) =>
      value.length > atIndex ? value[atIndex] : null;
}

class WeatherSearchItem {
  final String id;
  final String name;
  final String region;
  final String country;
  final double lat;
  final double lon;
  final String url;
  WeatherSearchItem({
    required this.id,
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    required this.url,
  });

  factory WeatherSearchItem.fromJson(Map<String, dynamic> map) {
    return WeatherSearchItem(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      region: map['region'] ?? '',
      country: map['country'] ?? '',
      lat: map['lat']?.toDouble() ?? 0.0,
      lon: map['lon']?.toDouble() ?? 0.0,
      url: map['url'] ?? '',
    );
  }
}
