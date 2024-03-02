import 'package:flutter/material.dart';
import 'package:hiwt/pages/cities.dart';

import 'wheater.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var initialCity = "";
    return SafeArea(
      child: Scaffold(
        body: initialCity.isEmpty ? const CitiesPage() : const WheaterPage(),
      ),
    );
  }
}
