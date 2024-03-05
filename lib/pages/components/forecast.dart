import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hiwt/core/models/forecast.dart';

class ForecastWidget extends StatelessWidget {
  final ForecastModel forecast;

  const ForecastWidget({
    super.key,
    required this.forecast,
  });

  Color getColor() {
    switch (forecast.condition) {
      case 'clear_day':
      case 'clear_night':
        return const Color.fromARGB(200, 240, 184, 101);
      case 'cloud':
      case 'cloudly_day':
      case 'cloudly_night':
        return const Color.fromARGB(162, 224, 224, 224);
      case 'rain':
      case 'storm':
        return const Color.fromARGB(221, 150, 181, 206);
      case 'hail':
      case 'snow':
      case 'fog':
        return const Color.fromARGB(255, 224, 224, 224);
      default:
        return Colors.transparent;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: getColor(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
                'assets/icons/weather_condition/${forecast.condition}.svg',
                width: 48,
                height: 48),
            const SizedBox(width: 16),
            Text(forecast.date!, style: const TextStyle(fontSize: 24)),
            Text('  |  ${forecast.min} ~ ${forecast.max}',
                style: const TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
