import 'package:flutter/material.dart';

class TempWidget extends StatelessWidget {
  final String max;
  final String min;
  final String date;

  const TempWidget({
    super.key,
    required this.max,
    required this.min,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(date, style: TextStyle(fontSize: 18)),
            Text('   |  Min.: $min   |   Máx.: $max',
                style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
