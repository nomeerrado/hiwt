import 'package:flutter/material.dart';
import 'package:hiwt/core/models/wheater.dart';

import '../core/singletons/app_manager.dart';
import 'cities.dart';
import 'components/temp.dart';
import 'components/weather_erro.dart';

class WheaterPage extends StatelessWidget {
  const WheaterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appManager = AppManagerSingleton();
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<WheaterModel?>(
          future: appManager.getWheater(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return const WheaterErrorWidget();
            } else if (snapshot.hasData) {
              if (snapshot.data == null || snapshot.data!.temp == null) {
                return const WheaterErrorWidget();
              } else {
                return Center(
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Text(
                            snapshot.data!.temp.toString(),
                            style: const TextStyle(fontSize: 128),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => const CitiesPage()),
                            ),
                            child: Text(
                              snapshot.data!.city ?? '',
                              style: const TextStyle(fontSize: 18),
                            ),
                          ),
                          Text(
                            snapshot.data!.description ?? '',
                            style: const TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      Expanded(
                        child: ListView.builder(
                          itemCount: snapshot.data!.forecast?.length ?? 0,
                          itemBuilder: (context, index) {
                            var item = snapshot.data!.forecast?[index];
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
                );
              }
            } else {
              return const WheaterErrorWidget();
            }
          },
        ),
      ),
    );
  }
}
