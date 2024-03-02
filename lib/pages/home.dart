import 'package:flutter/material.dart';
import 'package:hiwt/core/singletons/app_manager.dart';
import 'package:hiwt/pages/cities.dart';

import 'wheater.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var wheater = AppManagerSingleton().wheater;
    return Scaffold(
      body:
          wheater == null ? const CitiesPage() : WheaterPage(wheater: wheater),
    );
  }
}
