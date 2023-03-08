class Weather {
  final String name;
  final String region;
  final String country;
  final String localTime;
  final String last_updated;
  final double tempC;
  final double tempF;
  final String condition_text;
  final String condition_icon;
  final int condition_code;
  final double wind_mph;
  final double wind_kph;
  final int wind_degree;
  final String wind_dir;
  final double pressure_mb;
  final double pressure_in;
  final double precip_mm;
  final double precip_in;
  final int humidity;
  final int cloud;
  final double feelslike_c;
  final double feelslike_f;
  final double vis_km;
  final double vis_miles;
  final double uv;
  final double air_q_co;
  final double air_q_no2;
  final double air_q_o3;
  final double air_q_so2;
  final double air_q_pm2_5;
  final double air_q_pm10;
  Weather({
    required this.name,
    required this.region,
    required this.country,
    required this.localTime,
    required this.last_updated,
    required this.tempC,
    required this.tempF,
    required this.condition_text,
    required this.condition_icon,
    required this.condition_code,
    required this.wind_mph,
    required this.wind_kph,
    required this.wind_degree,
    required this.wind_dir,
    required this.pressure_mb,
    required this.pressure_in,
    required this.precip_mm,
    required this.precip_in,
    required this.humidity,
    required this.cloud,
    required this.feelslike_c,
    required this.feelslike_f,
    required this.vis_km,
    required this.vis_miles,
    required this.uv,
    required this.air_q_co,
    required this.air_q_no2,
    required this.air_q_o3,
    required this.air_q_so2,
    required this.air_q_pm2_5,
    required this.air_q_pm10,
  });

  factory Weather.fromJson(Map<String, dynamic> map) {
    return Weather(
      name: map['location']['name'] ?? '',
      region: map['location']['region'] ?? '',
      country: map['location']['country'] ?? '',
      localTime: map['location']['localtime'] ?? '',
      last_updated: map['current']['last_updated'] ?? '',
      tempC: map['current']['temp_c'] ?? 0.0,
      tempF: map['current']['temp_f']?.toDouble() ?? 0.0,
      condition_text: map['current']['condition']['text'] ?? '',
      condition_icon: map['current']['condition']['icon'] ?? '',
      condition_code: map['current']['condition']['code']?.toInt() ?? 0,
      wind_mph: map['current']['wind_mph']?.toDouble() ?? 0.0,
      wind_kph: map['current']['wind_kph']?.toDouble() ?? 0.0,
      wind_degree: map['current']['wind_degree']?.toInt() ?? 0,
      wind_dir: map['current']['wind_dir'] ?? '',
      pressure_mb: map['current']['pressure_mb']?.toDouble() ?? 0.0,
      pressure_in: map['current']['pressure_in']?.toDouble() ?? 0.0,
      precip_mm: map['current']['precip_mm']?.toDouble() ?? 0.0,
      precip_in: map['current']['precip_in']?.toDouble() ?? 0.0,
      humidity: map['current']['humidity']?.toInt() ?? 0,
      cloud: map['current']['cloud']?.toInt() ?? 0,
      feelslike_c: map['current']['feelslike_c']?.toDouble() ?? 0.0,
      feelslike_f: map['current']['feelslike_f']?.toDouble() ?? 0.0,
      vis_km: map['current']['vis_km']?.toDouble() ?? 0.0,
      vis_miles: map['current']['vis_miles']?.toDouble() ?? 0.0,
      uv: map['current']['uv']?.toDouble() ?? 0.0,
      air_q_co: map['current']['air_quality']['co']?.toDouble() ?? 0.0,
      air_q_no2: map['current']['air_quality']['no2']?.toDouble() ?? 0.0,
      air_q_o3: map['current']['air_quality']['o3']?.toDouble() ?? 0.0,
      air_q_so2: map['current']['air_quality']['so2']?.toDouble() ?? 0.0,
      air_q_pm2_5: map['current']['air_quality']['pm2_5']?.toDouble() ?? 0.0,
      air_q_pm10: map['current']['air_quality']['pm10']?.toDouble() ?? 0.0,
    );
  }

  // factory Weather.fromJson(Map<String,dynamic> source) =>
  //     Weather.fromMap(json.decode(source));
}
