import 'package:flutter/material.dart';
import 'package:hiwt/pages/weather.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'How is the wather today?',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        useMaterial3: true,
        fontFamily: 'MadimiOne',
      ),
      home: const WeatherPage(),
    );
  }
}
