class ForecastDay {
  final String date;
  final double maxTempC;
  final double minTempC;

  ForecastDay({
    required this.date,
    required this.maxTempC,
    required this.minTempC,
  });

  factory ForecastDay.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('date') && json.containsKey('day')) {
      final forecastDay = json['day'];
      return ForecastDay(
        date: json['date'],
        maxTempC: forecastDay['maxtemp_c']?.toDouble() ?? 0.0,
        minTempC: forecastDay['mintemp_c']?.toDouble() ?? 0.0,
      );
    } else {
      throw Exception('Некорректные данные для ForecastDay');
    }
  }
}
