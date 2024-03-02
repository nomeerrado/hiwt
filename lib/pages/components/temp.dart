import 'package:flutter/material.dart';

class TempWidget extends StatelessWidget {
  const TempWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('23', style: TextStyle(fontSize: 24)),
        Text('12:00', style: TextStyle(fontSize: 24)),
      ],
    );
  }
}
