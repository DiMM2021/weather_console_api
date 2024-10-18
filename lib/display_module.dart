import 'package:weather_console_app/json_module.dart';

void displayWeather(WeatherResponse weather) {
  print('''
Название города: ${weather.cityName}
Температура воздуха: ${weather.tempC}°C
Ощущается как: ${weather.feelsLikeC}°C
Метеорологические условия: ${weather.condition}
Последнее обновление: ${weather.lastUpdated}
''');

  if (weather.forecast != null) {
    print('Прогноз на следующие дни:');
    for (var day in weather.forecast!) {
      print(
          'Дата: ${day.date}, Максимальная температура: ${day.maxTempC}°C, Минимальная температура: ${day.minTempC}°C');
    }
  } else {
    print('Нет доступного прогноза на следующие дни.');
  }
}
