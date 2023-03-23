class Weather {
  final String name;
  final String region;
  final String country;
  final double lat;
  final double lon;
  final String localTime;
  final String lastUpdated;
  final double tempC;
  final double tempF;
  final String conditionText;
  final String conditionIcon;
  final int conditionCode;
  final double windMph;
  final double windKph;
  final int windDegree;
  final String windDir;
  final double pressureMb;
  final double pressureIn;
  final double precipMm;
  final double precipIn;
  final int humidity;
  final int cloud;
  final double feelslikeC;
  final double feelslikeF;
  final double visKm;
  final double visMiles;
  final double uv;
  final double airQco;
  final double airQno2;
  final double airQo3;
  final double airQso2;
  final double airQpm2_5;
  final double airQpm10;
  Weather({
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    required this.localTime,
    required this.lastUpdated,
    required this.tempC,
    required this.tempF,
    required this.conditionText,
    required this.conditionIcon,
    required this.conditionCode,
    required this.windMph,
    required this.windKph,
    required this.windDegree,
    required this.windDir,
    required this.pressureMb,
    required this.pressureIn,
    required this.precipMm,
    required this.precipIn,
    required this.humidity,
    required this.cloud,
    required this.feelslikeC,
    required this.feelslikeF,
    required this.visKm,
    required this.visMiles,
    required this.uv,
    required this.airQco,
    required this.airQno2,
    required this.airQo3,
    required this.airQso2,
    required this.airQpm2_5,
    required this.airQpm10,
  });

  factory Weather.fromJson(Map<String, dynamic> map) {
    return Weather(
      name: map['location']['name'] ?? '',
      region: map['location']['region'] ?? '',
      country: map['location']['country'] ?? '',
      lat: map['location']['lat']?.toDouble() ?? 0.0,
      lon: map['location']['lon']?.toDouble() ?? 0.0,
      localTime: map['location']['localtime'] ?? '',
      lastUpdated: map['current']['last_updated'] ?? '',
      tempC: map['current']['temp_c']?.toDouble() ?? 0.0,
      tempF: map['current']['temp_f']?.toDouble() ?? 0.0,
      conditionText: map['current']['condition']['text'] ?? '',
      conditionIcon: map['current']['condition']['icon'] ?? '',
      conditionCode: map['current']['condition']['code']?.toInt() ?? 0,
      windMph: map['current']['wind_mph']?.toDouble() ?? 0.0,
      windKph: map['current']['wind_kph']?.toDouble() ?? 0.0,
      windDegree: map['current']['wind_degree']?.toInt() ?? 0,
      windDir: map['current']['wind_dir'] ?? '',
      pressureMb: map['current']['pressure_mb']?.toDouble() ?? 0.0,
      pressureIn: map['current']['pressure_in']?.toDouble() ?? 0.0,
      precipMm: map['current']['precip_mm']?.toDouble() ?? 0.0,
      precipIn: map['current']['precip_in']?.toDouble() ?? 0.0,
      humidity: map['current']['humidity']?.toInt() ?? 0,
      cloud: map['current']['cloud']?.toInt() ?? 0,
      feelslikeC: map['current']['feelslike_c']?.toDouble() ?? 0.0,
      feelslikeF: map['current']['feelslike_f']?.toDouble() ?? 0.0,
      visKm: map['current']['vis_km']?.toDouble() ?? 0.0,
      visMiles: map['current']['vis_miles']?.toDouble() ?? 0.0,
      uv: map['current']['uv']?.toDouble() ?? 0.0,
      airQco: map['current']['air_quality']['co']?.toDouble() ?? 0.0,
      airQno2: map['current']['air_quality']['no2']?.toDouble() ?? 0.0,
      airQo3: map['current']['air_quality']['o3']?.toDouble() ?? 0.0,
      airQso2: map['current']['air_quality']['so2']?.toDouble() ?? 0.0,
      airQpm2_5: map['current']['air_quality']['pm2_5']?.toDouble() ?? 0.0,
      airQpm10: map['current']['air_quality']['pm10']?.toDouble() ?? 0.0,
    );
  }
}
