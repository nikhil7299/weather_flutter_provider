import 'dart:collection';
import 'package:flutter/material.dart';

class WeatherBook extends ChangeNotifier {
  final List<WeatherSearchItem> _weatherSearchItems = [];

  UnmodifiableListView<WeatherSearchItem> get items =>
      UnmodifiableListView(_weatherSearchItems);

  void add({required WeatherSearchItem weatherSearchItem}) {
    if (!_weatherSearchItems.contains(weatherSearchItem)) {
      _weatherSearchItems.add(weatherSearchItem);
      notifyListeners();
    }
  }

  void remove({required double lat, required double lon}) {
    _weatherSearchItems
        .removeWhere((element) => element.lat == lat && element.lon == lon);
    notifyListeners();
  }

  void reset() {
    _weatherSearchItems.clear();
    notifyListeners();
  }

  int get length => _weatherSearchItems.length;
}

class WeatherSearchItem {
  final int? id;
  final String? name;
  final String? region;
  final String? country;
  final double lat;
  final double lon;
  final String? url;
  WeatherSearchItem({
    this.id,
    this.name,
    this.region,
    this.country,
    required this.lat,
    required this.lon,
    this.url,
  });

  factory WeatherSearchItem.fromJson(Map<String, dynamic> map) {
    return WeatherSearchItem(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      region: map['region'] ?? '',
      country: map['country'] ?? '',
      lat: map['lat']?.toDouble() ?? 0.0,
      lon: map['lon']?.toDouble() ?? 0.0,
      url: map['url'] ?? '',
    );
  }

  @override
  bool operator ==(covariant WeatherSearchItem other) =>
      identical(this, other) ||
      (id == other.id &&
          name == other.name &&
          region == other.region &&
          country == other.country &&
          lat == other.lat &&
          lon == other.lon &&
          url == other.url);

  @override
  int get hashCode => Object.hashAll([
        id,
        name,
        region,
        country,
        lat,
        lon,
        url,
      ]);
}
