import '../models/forecast.dart';
import '../models/wheater.dart';

final weatherMock = WheaterModel(
  city: "Cuiabá, MT",
  temp: 25,
  description: 'Ensolarado',
  condition: 'clear_day',
  forecast: [
    ForecastModel(
      date: "03/03",
      min: 25,
      max: 30,
      description: "Dia nublado",
      condition: "cloudly_day",
    ),
    ForecastModel(
      date: "04/03",
      min: 23,
      max: 27,
      description: "Chuva intensa",
      condition: "storm",
    ),
    ForecastModel(
      date: "05/03",
      min: 19,
      max: 23,
      description: "Chuva moderada",
      condition: "rain",
    ),
    ForecastModel(
      date: "06/03",
      min: 20,
      max: 25,
      description: "Chuva leve",
      condition: "rain",
    ),
    ForecastModel(
      date: "07/03",
      min: 22,
      max: 28,
      description: "Dia nublado",
      condition: "cloudly_day",
    ),
  ],
);
