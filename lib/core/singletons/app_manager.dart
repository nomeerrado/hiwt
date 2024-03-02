import '../models/wheater.dart';
import '../services/wheater.dart';

class AppManagerSingleton {
  static final AppManagerSingleton _instance = AppManagerSingleton._internal();

  factory AppManagerSingleton() => _instance;
  AppManagerSingleton._internal();

  final _service = WheaterService();
  WheaterModel? wheater;

  Future<void> getWheater(String cityName) async {
    wheater = await _service.getWheater(cityName);
  }

  Future<void> changeCity(String cityName) async {
    if (cityName.isNotEmpty) {
      wheater = await _service.getWheater(cityName);
    }
  }

  void dispose() {
    wheater = null;
  }
}
