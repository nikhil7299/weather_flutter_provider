import 'dart:convert';

import 'package:weather/model/weather_book.dart';
import 'package:weather/model/weather_model.dart';
import "package:http/http.dart" as http;

class WeatherService {
  Future<Weather> getWeatherGeo(
      {required double latitude, required double longitude}) async {
    try {
      final queryParameters = {
        'key': '12f032f059ec484eb97150520230203',
        'q': '$latitude,$longitude',
        'aqi': 'yes',
      };
      final uri =
          Uri.http('api.weatherapi.com', '/v1/current.json', queryParameters);
      final response = await http.get(uri);
      // print("from geo");
      // print(response.body);
      if (response.statusCode == 200) {
        return Weather.fromJson(jsonDecode(response.body));
      } else {
        throw Exception("Can not get weather");
      }
    } catch (e) {
      // print(e);
      rethrow;
    }
  }

  Future<Weather> getWeatherData({required String place}) async {
    try {
      final queryParameters = {
        'key': '12f032f059ec484eb97150520230203',
        'q': place,
        'aqi': 'yes',
      };
      final uri =
          Uri.http('api.weatherapi.com', '/v1/current.json', queryParameters);
      final response = await http.get(uri);
      // print(response.body);
      if (response.statusCode == 200) {
        return Weather.fromJson(jsonDecode(response.body));
      } else {
        throw Exception("Can not get weather");
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<WeatherSearchItem>> getWeatherSearch(
      {required String searchTerm}) async {
    try {
      final queryParameters = {
        'key': '12f032f059ec484eb97150520230203',
        'q': searchTerm,
      };
      final uri =
          Uri.http('api.weatherapi.com', '/v1/search.json', queryParameters);
      final response = await http.get(uri);
      // print(response.body);
      if (response.statusCode == 200) {
        Iterable list = json.decode(response.body);
        // print(list);
        List<WeatherSearchItem> weatherSearchItems =
            List<WeatherSearchItem>.from(
                list.map((model) => WeatherSearchItem.fromJson(model)));
        return weatherSearchItems;
      } else {
        throw Exception("Cannot get Search Results");
      }
    } catch (e) {
      // print(e);
      rethrow;
    }
  }
}
