class ApiConfig {
  static final ApiConfig _instance = ApiConfig._internal();

  final String apiKey;
  final String baseUrl;
  final String currentUrl;
  final String forecastUrl;

  ApiConfig._internal()
      : apiKey = _getApiKey(),
        baseUrl = 'https://api.weatherapi.com/v1',
        currentUrl = 'current.json',
        forecastUrl = 'forecast.json';

  static String _getApiKey() {
    return '01893625f9974c2083194748241710';
  }

  static ApiConfig get instance => _instance;
}
