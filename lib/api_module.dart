import 'package:weather_console_app/config.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:weather_console_app/json_module.dart';

class WeatherApiClient {
  final String _apiKey;
  final String _baseUrl;
  final String _currentUrl;
  final String _forecastUrl;

  WeatherApiClient()
      : _apiKey = ApiConfig.instance.apiKey,
        _baseUrl = ApiConfig.instance.baseUrl,
        _currentUrl = ApiConfig.instance.currentUrl,
        _forecastUrl = ApiConfig.instance.forecastUrl;

  String _buildUrl(String city) {
    return '$_baseUrl/$_currentUrl?key=$_apiKey&q=$city';
  }

  String _buildForecastUrl(String city, int days) {
    return '$_baseUrl/$_forecastUrl?key=$_apiKey&q=$city&days=$days';
  }

  Future<WeatherResponse> fetchWeather(String city) async {
    final String url = _buildUrl(city);
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      String jsonResponse = utf8.decode(response.bodyBytes);
      return WeatherResponse.fromJson(jsonDecode(jsonResponse));
    } else {
      throw Exception('Ошибка загрузки данных: ${response.body}');
    }
  }

  Future<WeatherResponse> fetchForecast(String city, int days) async {
    final String url = _buildForecastUrl(city, days);
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return WeatherResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(
          'Не удалось загрузить данные о прогнозе погоды: ${response.body}');
    }
  }
}
