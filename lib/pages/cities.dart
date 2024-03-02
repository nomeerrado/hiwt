import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hiwt/core/singletons/app_manager.dart';
import 'package:hiwt/core/utils/cities.dart';

class CitiesPage extends StatelessWidget {
  const CitiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final citiesNames = CityUtils.cities.entries;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const Text('Selecine uma cidade para ver a previsão do tempo.'),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  var cityName = citiesNames.elementAt(index).key;
                  return ListTile(
                    title: Text(cityName),
                    onTap: () {
                      AppManagerSingleton().changeCity(cityName);
                      context.goNamed('/');
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
