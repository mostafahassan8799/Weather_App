import 'package:flutter/widgets.dart';
import 'package:weathers/models/weather_model.dart';

class WeatherProvider extends ChangeNotifier{
  WeatherModel? _weatherData;
  String? cityName;

  WeatherModel? get weatherData => _weatherData;

  set weatherData(WeatherModel? value) {
    _weatherData = value;
    notifyListeners();
  }

  // WeatherModel? get weatherData => _weatherData;
}