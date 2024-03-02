import 'package:flutter/material.dart';

import '../core/models/wheater.dart';
import '../core/services/wheater.dart';
import 'components/temp.dart';

class WheaterPage extends StatefulWidget {
  const WheaterPage({super.key});

  @override
  State<WheaterPage> createState() => _WheaterPageState();
}

class _WheaterPageState extends State<WheaterPage> {
  final _service = WheaterService();
  WheaterModel? wheater;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Column(
            children: [
              Text('28', style: TextStyle(fontSize: 128)),
              Text('Parcialmente Nublado', style: TextStyle(fontSize: 18)),
            ],
          ),
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TempWidget(),
              TempWidget(),
              TempWidget(),
              TempWidget(),
            ],
          ),
        ),
      ],
    );
  }
}
