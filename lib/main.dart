import 'package:flutter/material.dart';
import 'package:weather/model/weather_book.dart';
import 'package:weather/search_weather_view.dart';
import 'package:weather/weather_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Main',
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(useMaterial3: true),
      theme: ThemeData(useMaterial3: true),
      home: const HomePage(),
      routes: {
        '/search-weather': (context) => const SearchWeatherView(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: WeatherBook(),
      builder: (context, value, child) {
        final weathers = value;
        // final weathers =c
        return DefaultTabController(
          length: weathers.length,
          initialIndex: 0,
          child: Scaffold(
            body: TabBarView(
              children: weathers
                  .map((weatherSearchItem) => WeatherView(
                        lat: weatherSearchItem.lat,
                        lon: weatherSearchItem.lon,
                      ))
                  .toList(),
              // children: cities.map((city) => WeatherView(city: city)).toList(),
            ),
            floatingActionButton: SizedBox(
              height: 40,
              width: 90,
              child: FittedBox(
                alignment: Alignment.centerRight,
                child: FloatingActionButton.extended(
                  extendedPadding: const EdgeInsets.symmetric(horizontal: 17),
                  isExtended: true,
                  icon: const Icon(
                    Icons.add,
                  ),
                  label: const Text(
                    "Add City",
                  ),
                  onPressed: () async {
                    await Navigator.of(context).pushNamed('/search-weather');
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60),
                  ),
                ),
              ),
            ),
            bottomNavigationBar: Container(
              margin: const EdgeInsets.only(
                  bottom: 20, top: 5, left: 10, right: 10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(60)),
              child: TabBar(
                splashBorderRadius: BorderRadius.circular(60),
                splashFactory: NoSplash.splashFactory,
                indicatorPadding:
                    const EdgeInsets.symmetric(horizontal: -16, vertical: 5),
                isScrollable: true,
                padding: const EdgeInsets.symmetric(horizontal: 5),
                labelColor: Colors.white,
                dividerColor: Colors.transparent,
                indicatorColor: Colors.transparent,
                indicator: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(60),
                ),
                tabs: weathers
                    .map(
                      (weatherSearchItem) => Tab(
                        child: Row(
                          children: [
                            const Icon(
                              Icons.person,
                              size: 15,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              weatherSearchItem.name.toUpperCase(),
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        );
      },
    );
  }
}
