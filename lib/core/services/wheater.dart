import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hiwt/core/models/wheater.dart';
import 'package:hiwt/core/utils/cities.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class WheaterService {
  Future<WheaterModel?> getWheater(String cityName) async {
    final woeid = CityUtils.getWOEID(cityName);
    String url = 'https://api.hgbrasil.com/weather?woeid=$woeid';
    Map<String, String> headers = <String, String>{};
    headers.putIfAbsent('Accept', () => 'application/json');

    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: headers,
      );

      var wheater =
          WheaterModel.fromJson(json.decode(response.body)['results']);

      if (wheater.forecast != null && wheater.forecast!.isNotEmpty) {
        final dateFormat = DateFormat('dd/MM');
        if (wheater.forecast!.first.data! ==
            dateFormat.format(DateTime.now().add(const Duration(days: -1)))) {
          wheater.forecast!.removeAt(0);
        }
      }

      return wheater;
    } catch (e) {
      if (kDebugMode) {
        print('Exception: $e');
      }
      return null;
    }
  }
}
