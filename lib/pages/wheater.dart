import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hiwt/core/models/wheater.dart';

import 'components/temp.dart';

class WheaterPage extends StatelessWidget {
  final WheaterModel wheater;

  const WheaterPage({super.key, required this.wheater});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Column(
              children: [
                Text(
                  wheater!.temp.toString(),
                  style: const TextStyle(fontSize: 128),
                ),
                GestureDetector(
                  onTap: () => context.go('/cities'),
                  child: Text(
                    wheater.city ?? '',
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
                Text(
                  wheater.description ?? '',
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Expanded(
              child: ListView.builder(
                itemCount: wheater.forecast?.length ?? 0,
                itemBuilder: (context, index) {
                  var item = wheater.forecast?[index];
                  if (item == null) return const SizedBox();

                  return TempWidget(
                    date: item.data!,
                    max: item.maxima.toString(),
                    min: item.minima.toString(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
