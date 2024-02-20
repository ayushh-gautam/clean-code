class ApiEndpoint {
  static const apiKey = '4c4b664fe4018cf1d877668bd30c7fef';
  static const String _BaseUri = 'https://api.openweathermap.org/data/2.5';
  static const String weatherAPi =
      '$_BaseUri/weather?lat=26.4525&lon=87.2718&appid=$apiKey&units=metric';
}
