import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class WeatherDetails extends StatelessWidget {
  final Size size;
  final Icon? icon;
  final WindIcon? windIcon;
  final String text;
  final String data;
  final String? dataText;
  const WeatherDetails({
    super.key,
    required this.size,
    this.icon,
    required this.text,
    required this.data,
    this.windIcon,
    this.dataText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.21,
      height: size.height * 0.13,
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          icon ?? windIcon as StatelessWidget,
          const SizedBox(height: 10),
          Text(
            text,
            style: const TextStyle(fontSize: 8),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                data,
                style: const TextStyle(fontSize: 15),
              ),
              Text(
                dataText!,
                style: const TextStyle(fontSize: 8),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
