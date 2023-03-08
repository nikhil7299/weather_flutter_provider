import 'package:flutter/material.dart';
import 'package:weather/model/weather_model.dart';
import 'package:weather/service/weather_service.dart';

class WeatherView extends StatefulWidget {
  // final String city;
  final double lat;
  final double lon;
  const WeatherView({super.key, required this.lat, required this.lon});

  @override
  State<WeatherView> createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  final weatherService = WeatherService();

  Future<void> refresh() async {
    setState(() {});
    return Future.delayed(
      const Duration(seconds: 1),
    );
  }

  Future<Weather> weatherInfo(double lat, double lon) async {
    // var geoLocation = await GetPosition();
    return await weatherService.getWeatherGeo(latitude: lat, longitude: lon);
    // return await weatherService.getWeatherData(place);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return FutureBuilder(
      // initialData: weatherData,
      future: weatherInfo(widget.lat, widget.lon),
      builder: (context, snapshot) {
        return (snapshot.hasData)
            ? RefreshIndicator(
                onRefresh: refresh,
                child: ListView(
                  padding: const EdgeInsets.only(top: 0),
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(55)),
                      height: size.height * 0.55,
                      width: size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 30),
                          Text(
                            snapshot.data!.name,
                            style: const TextStyle(
                                fontSize: 35, color: Colors.white),
                          ),
                          const Icon(
                            Icons.location_on_sharp,
                            size: 15,
                          ),
                          const SizedBox(height: 150),
                          Text(
                            '${snapshot.data!.tempC.floor().toString()}°',
                            style: const TextStyle(
                                fontSize: 80, color: Colors.white),
                          ),
                          const Text(
                            "Sun 28° / 13°",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            "Mostly Sunny",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            : (snapshot.hasError)
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.error_rounded),
                      Text("Error"),
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircularProgressIndicator(),
                      Text("Loading"),
                    ],
                  );
      },
    );
  }
}
