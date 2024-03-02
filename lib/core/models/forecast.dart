class ForecastModel {
  ForecastModel({
    this.data,
    this.diaDaSemana,
    this.maxima,
    this.minima,
    this.descricao,
  });

  final String? data;
  final String? diaDaSemana;
  final int? maxima;
  final int? minima;
  final String? descricao;

  factory ForecastModel.fromJson(Map<String, dynamic> json) => ForecastModel(
        data: json['date'],
        diaDaSemana: json['weekday'],
        maxima: json['max'],
        minima: json['min'],
        descricao: json['description'],
      );
}
