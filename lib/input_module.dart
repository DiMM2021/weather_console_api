import 'dart:convert';
import 'dart:io';

class InputModule {
  String? getCityName() {
    String? inputCityName;

    while (true) {
      print('Введите название города: ');
      inputCityName = stdin.readLineSync(encoding: utf8);

      if (inputCityName != null && inputCityName.trim().isNotEmpty) {
        break;
      } else {
        print(
            'Ошибка: название города не может быть пустым. Попробуйте снова.');
      }
    }
    return inputCityName;
  }

  int? getForecastDays() {
    String? inputDays;
    int? forecastDays;

    while (true) {
      print(
          'Введите количество дней для прогноза погоды (или просто нажмите Enter для пропуска): ');
      inputDays = stdin.readLineSync();

      if (inputDays == null || inputDays.trim().isEmpty) {
        return null;
      }

      forecastDays = int.tryParse(inputDays);

      if (forecastDays != null && forecastDays > 0) {
        break;
      } else {
        print(
            'Ошибка: пожалуйста, введите положительное число. Попробуйте снова.');
      }
    }
    return forecastDays;
  }
}
