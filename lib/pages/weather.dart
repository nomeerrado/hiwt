import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hiwt/core/models/wheater.dart';

import '../core/singletons/app_manager.dart';
import 'cities.dart';
import 'components/forecast.dart';
import 'components/weather_erro.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appManager = AppManagerSingleton();
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<WheaterModel?>(
          future: appManager.getWheaterMock(),
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
                            style: const TextStyle(
                              fontSize: 128,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/icons/weather_condition/${snapshot.data!.condition}.svg',
                                width: 48,
                                height: 48,
                              ),
                              const SizedBox(width: 8.0),
                              Text(
                                snapshot.data!.description ?? '',
                                style: const TextStyle(fontSize: 24),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16.0),
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
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      Expanded(
                        child: ListView.builder(
                          itemCount: snapshot.data!.forecast?.length ?? 0,
                          itemBuilder: (context, index) {
                            var item = snapshot.data!.forecast?[index];
                            if (item == null) return const SizedBox();
                            return ForecastWidget(forecast: item);
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
