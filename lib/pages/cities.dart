import 'package:flutter/material.dart';
import 'package:hiwt/core/singletons/app_manager.dart';
import 'package:hiwt/core/utils/cities.dart';
import 'package:hiwt/pages/wheater.dart';

class CitiesPage extends StatelessWidget {
  const CitiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final citiesNames = CityUtils.cities.entries;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Selecine uma cidade para ver a previsão do tempo',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  var cityName = citiesNames.elementAt(index).key;
                  return ListTile(
                    title: Text(cityName),
                    onTap: () {
                      AppManagerSingleton().cityName = cityName;
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const WheaterPage(),
                        ),
                      );
                    },
                  );
                },
                itemCount: CityUtils.cities.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
