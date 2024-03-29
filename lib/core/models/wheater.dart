import 'forecast.dart';

class WheaterModel {
  WheaterModel({
    this.city,
    this.temp,
    this.date,
    this.time,
    this.description,
    this.condition,
    this.forecast,
  });

  final String? city;
  final int? temp;
  final String? date;
  final String? time;
  final String? description;
  final String? condition;
  final List<ForecastModel>? forecast;

  factory WheaterModel.fromJson(Map<String, dynamic> json) => WheaterModel(
        city: json['city'],
        temp: json['temp'],
        date: json['date'],
        time: json['time'],
        description: json['description'],
        condition: json['condition'],
        forecast: json['forecast'] == null
            ? []
            : List<ForecastModel>.from(
                json['forecast'].map((x) => ForecastModel.fromJson(x)),
              ),
      );
}
