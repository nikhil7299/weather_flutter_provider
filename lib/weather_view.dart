import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/model/weather_book.dart';
import 'package:weather/model/weather_model.dart';
import 'package:weather/service/weather_service.dart';
import 'package:weather/widgets/details.dart';
import 'package:weather_icons/weather_icons.dart';

class WeatherView extends StatefulWidget {
  // final String city;
  final double lat;
  final double lon;
  final bool isRemovable;
  const WeatherView(
      {super.key,
      required this.lat,
      required this.lon,
      required this.isRemovable});

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
    return await weatherService.getWeatherGeo(latitude: lat, longitude: lon);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return FutureBuilder(
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
                          const SizedBox(height: 50),
                          Text(
                            snapshot.data!.name,
                            style: const TextStyle(
                                fontSize: 35, color: Colors.white),
                          ),
                          const Icon(
                            Icons.location_on_sharp,
                            size: 15,
                          ),
                          const SizedBox(height: 100),
                          Text(
                            '${snapshot.data!.tempC.floor().toString()}°',
                            style: const TextStyle(
                                fontSize: 80, color: Colors.white),
                          ),
                          Text(
                            "${snapshot.data!.region}, ${snapshot.data!.country}",
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(
                                  "https:${snapshot.data!.conditionIcon}",
                                  color: Colors.white),
                              Text(
                                snapshot.data!.conditionText,
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(snapshot.data!.localTime),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Divider(),
                    const Text("  Weather Details"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        WeatherDetails(
                          size: size,
                          icon: const Icon(WeatherIcons.thermometer),
                          text: "Feels Like",
                          data: "${snapshot.data!.feelslikeC} °C",
                          dataText: "",
                        ),
                        WeatherDetails(
                          size: size,
                          windIcon: WindIcon(degree: snapshot.data!.windDegree),
                          text: "${snapshot.data!.windDir} wind",
                          data: "${snapshot.data!.windKph}",
                          dataText: " km/h",
                        ),
                        WeatherDetails(
                          size: size,
                          icon: const Icon(WeatherIcons.humidity),
                          text: "Humidity",
                          data: "${snapshot.data!.humidity}",
                          dataText: " %",
                        ),
                        WeatherDetails(
                          size: size,
                          icon: const Icon(WeatherIcons.cloudy),
                          text: "Cloud",
                          data: snapshot.data!.cloud.toString(),
                          dataText: " %",
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        WeatherDetails(
                          size: size,
                          text: "Precipitation",
                          icon: const Icon(WeatherIcons.raindrops),
                          dataText: " mm",
                          data: "${snapshot.data!.precipMm}",
                        ),
                        WeatherDetails(
                          size: size,
                          icon: const Icon(WeatherIcons.barometer),
                          text: "Pressure",
                          data: "${snapshot.data!.pressureIn}",
                          dataText: " inHg",
                        ),
                        WeatherDetails(
                          size: size,
                          icon: const Icon(Icons.arrow_circle_up_rounded),
                          text: "Visibility",
                          data: "${snapshot.data!.visKm}",
                          dataText: " Km",
                        ),
                        WeatherDetails(
                          size: size,
                          text: "UV",
                          icon: const Icon(WeatherIcons.day_sunny),
                          dataText: " Very Weak",
                          data: "${snapshot.data!.uv}",
                        ),
                      ],
                    ),
                    const Divider(color: Colors.white24),
                    const Text("  Air Quality"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        WeatherDetails(
                          size: size,
                          icon: const Icon(Icons.air_rounded),
                          text: "CO",
                          data: snapshot.data!.airQco.toInt().toString(),
                          dataText: "",
                        ),
                        WeatherDetails(
                          size: size,
                          icon: const Icon(Icons.air_rounded),
                          text: "NO2",
                          data: snapshot.data!.airQno2.toInt().toString(),
                          dataText: "",
                        ),
                        WeatherDetails(
                          size: size,
                          icon: const Icon(Icons.air_rounded),
                          text: "SO2".toUpperCase(),
                          data: snapshot.data!.airQso2.toInt().toString(),
                          dataText: "",
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        WeatherDetails(
                          size: size,
                          icon: const Icon(Icons.air_rounded),
                          text: "O3",
                          data: snapshot.data!.airQo3.toInt().toString(),
                          dataText: "",
                        ),
                        WeatherDetails(
                          size: size,
                          icon: const Icon(Icons.air_rounded),
                          text: "PM 2.5",
                          data: snapshot.data!.airQpm2_5.toInt().toString(),
                          dataText: "",
                        ),
                        WeatherDetails(
                          size: size,
                          icon: const Icon(Icons.air_rounded),
                          text: "PM 10",
                          data: snapshot.data!.airQpm10.toInt().toString(),
                          dataText: "",
                        ),
                      ],
                    ),
                    const Divider(),
                    (widget.isRemovable)
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 5),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 35, vertical: 10),
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    var weatherSearchItems =
                                        Provider.of<WeatherBook>(context,
                                            listen: false);
                                    weatherSearchItems.remove(
                                      lat: snapshot.data!.lat,
                                      lon: snapshot.data!.lon,
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: Size(
                                        size.width * 0.7, size.width * 0.085),
                                  ),
                                  icon: const Icon(Icons.remove_circle_rounded),
                                  label: const Text("Remove City"),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 5),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 35, vertical: 10),
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    var weatherSearchItems =
                                        Provider.of<WeatherBook>(context,
                                            listen: false);
                                    weatherSearchItems.reset();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: Size(
                                        size.width * 0.7, size.width * 0.085),
                                  ),
                                  icon: const Icon(Icons.remove_circle_rounded),
                                  label: const Text("Remove All Cities"),
                                ),
                              ),
                            ],
                          )
                        : Container(
                            padding: const EdgeInsets.all(20),
                            child: const Text(
                              "Geolocation Weather",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white38),
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
