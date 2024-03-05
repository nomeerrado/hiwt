class ForecastModel {
  ForecastModel({
    this.date,
    this.weekDay,
    this.max,
    this.min,
    this.description,
    this.condition,
  });

  final String? date;
  final String? weekDay;
  final int? max;
  final int? min;
  final String? description;
  final String? condition;

  factory ForecastModel.fromJson(Map<String, dynamic> json) => ForecastModel(
        date: json['date'],
        weekDay: json['weekday'],
        max: json['max'],
        min: json['min'],
        description: json['description'],
        condition: json['condition'],
      );
}
