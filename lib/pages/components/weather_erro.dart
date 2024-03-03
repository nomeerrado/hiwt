import 'package:flutter/material.dart';
import 'package:hiwt/pages/cities.dart';

class WheaterErrorWidget extends StatelessWidget {
  const WheaterErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Erro ao buscar a previsão do tempo',
            style: TextStyle(color: Colors.red),
          ),
          const SizedBox(height: 24.0),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const CitiesPage()),
            ),
            child: const Text('Mudar cidade'),
          ),
        ],
      ),
    );
  }
}
