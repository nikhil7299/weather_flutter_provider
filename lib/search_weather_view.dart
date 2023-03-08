import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:weather/model/weather_book.dart';
import 'package:weather/service/weather_service.dart';

class SearchWeatherView extends StatefulWidget {
  const SearchWeatherView({super.key});

  @override
  State<SearchWeatherView> createState() => _SearchWeatherViewState();
}

class _SearchWeatherViewState extends State<SearchWeatherView> {
  late final TextEditingController _searchController;
  final weatherService = WeatherService();

  void dismissKeyboard() => FocusManager.instance.primaryFocus?.unfocus();

  @override
  void initState() {
    _searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  // void onPress() {
  //   List<WeatherSearchItem> searchItems = weatherService.getWeatherSearch(_searchController.text);

  // }
  Future<List<WeatherSearchItem>> weatherSearch(String place) async {
    return await weatherService.getWeatherSearch(searchTerm: place);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Search City",
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 2),
                height: 40,
                width: size.width * 0.7,
                child: TextFormField(
                  controller: _searchController,
                  enableInteractiveSelection: true,
                  onTapOutside: (event) => dismissKeyboard(),
                  cursorColor: Colors.teal,
                  style: const TextStyle(fontSize: 15),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    suffixIcon: _searchController.text.isEmpty
                        ? null
                        : IconButton(
                            icon: const Icon(Icons.cancel_outlined),
                            onPressed: _searchController.clear,
                            color: Colors.tealAccent,
                            iconSize: 15,
                          ),
                    labelText: " City Name...",
                    labelStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w300),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: const BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: const BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Row(
                  children: const [
                    Icon(
                      Icons.search_rounded,
                      size: 15,
                    ),
                    SizedBox(width: 5),
                    Text("Search"),
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 30),
          // FutureBuilder(
          //   future: weatherSearch(_searchController.text),
          //   builder:
          // (context, snapshot) {

          // },
          // ),
        ],
      ),
    );
  }
}
