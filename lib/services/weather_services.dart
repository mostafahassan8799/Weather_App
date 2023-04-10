import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weathers/models/weather_model.dart';

class WeatherService {
  Future<WeatherModel> getWeather(String cityName) async {
    String baseUrl = 'http://api.weatherapi.com/v1';
    String apiKey = 'e5b0901abfe54b7b94a172542232501';
    Uri url =
        Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7');
    http.Response response = await http.get(url);
    Map<String, dynamic> data = jsonDecode(response.body);

    //print(data);
    WeatherModel model = WeatherModel.fromJson(data);
    return model;
  }
}
