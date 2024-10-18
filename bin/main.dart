import 'package:weather_console_app/api_module.dart';
import 'package:weather_console_app/display_module.dart';
import 'package:weather_console_app/input_module.dart';
import 'package:weather_console_app/json_module.dart';

void main(List<String> arguments) async {
  InputModule inputModule = InputModule();
  WeatherApiClient weatherApiClient = WeatherApiClient(); // Создаем экземпляр WeatherApiClient
  String? cityName = inputModule.getCityName();

  if (cityName != null) {
    // Получаем количество дней для прогноза (может быть null)
    int? forecastDays = inputModule.getForecastDays();

    try {
      // Получаем данные о текущей погоде
      WeatherResponse weather = await weatherApiClient.fetchWeather(cityName); // Исправлено здесь

      // Проверяем, если forecastDays не равен null, получаем прогноз
      if (forecastDays != null) {
        WeatherResponse forecastWeather = await weatherApiClient.fetchForecast(cityName, forecastDays);
        weather.forecast = forecastWeather.forecast; // Добавляем прогноз в объект weather
      }

      // Выводим данные о погоде
      displayWeather(weather);
    } catch (e) {
      print('Не удалось получить данные о погоде: $e');
    }
  }
}
