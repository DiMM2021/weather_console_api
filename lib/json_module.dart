import 'dart:convert';
import 'package:weather_console_app/forecast.dart';

class WeatherResponse {
  final String lastUpdated;
  final String cityName;
  final double tempC;
  final double feelsLikeC;
  final String condition;
  List<ForecastDay>? forecast;

  WeatherResponse({
    required this.lastUpdated,
    required this.cityName,
    required this.tempC,
    required this.feelsLikeC,
    required this.condition,
    this.forecast,
  });

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    final currentData = json['current'];

    WeatherResponse weather = WeatherResponse(
      lastUpdated: currentData['last_updated'] ?? 'Неизвестно',
      cityName: json['location']['name'] ?? 'Неизвестный город',
      tempC: currentData['temp_c']?.toDouble() ?? 0.0,
      feelsLikeC: currentData['feelslike_c']?.toDouble() ?? 0.0,
      condition: currentData['condition']['text'] ?? 'Нет данных',
    );

    if (json.containsKey('forecast')) {
      List<ForecastDay> forecastDays = (json['forecast']['forecastday'] as List)
          .map((day) => ForecastDay.fromJson(day))
          .toList();
      weather = WeatherResponse(
        lastUpdated: weather.lastUpdated,
        cityName: weather.cityName,
        tempC: weather.tempC,
        feelsLikeC: weather.feelsLikeC,
        condition: weather.condition,
        forecast: forecastDays,
      );
    }
    return weather;
  }
}

class WeatherService {
  WeatherResponse parseWeatherResponse(String responseBody) {
    final Map<String, dynamic> json = jsonDecode(responseBody);
    return WeatherResponse.fromJson(json);
  }
}
