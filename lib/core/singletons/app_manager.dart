import '../models/wheater.dart';
import '../services/wheater.dart';

class AppManagerSingleton {
  static final AppManagerSingleton _instance = AppManagerSingleton._internal();

  factory AppManagerSingleton() => _instance;
  AppManagerSingleton._internal();

  final _service = WheaterService();

  String? cityName;

  Future<WheaterModel?> getWheater() async {
    if (cityName == null || cityName!.isEmpty) {
      return null;
    }

    return await _service.getWheater(cityName!);
  }
}
