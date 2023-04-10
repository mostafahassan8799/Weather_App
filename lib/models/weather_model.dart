import 'package:flutter/material.dart';

class WeatherModel {
  String date;
  double temp;
  double min_temp;
  double max_temp;
  String weatherStateName;

  WeatherModel({required this.date,
    required this.temp,
    required this.min_temp,
    required this.max_temp,
    required this.weatherStateName,});

  factory WeatherModel.fromJson (dynamic data){
    var jsonData = data['forecast']['forecastday'][0]['day'];
    return WeatherModel(
    date : data['location']['localtime'],
    temp : jsonData['avgtemp_c'],
    min_temp : jsonData['mintemp_c'],
    max_temp : jsonData['maxtemp_c'],
    weatherStateName : jsonData['condition']['text']);
  }
  @override
  String toString() {
    return ' temp =$temp   date = $date';
    return super.toString();
  }
  String getImage(){
    if(weatherStateName == 'Clear' || weatherStateName == 'Light cloud'){
      return 'assets/images/clear.png';
    }else if (weatherStateName == 'Sleet' || weatherStateName == 'Snow'
                || weatherStateName == 'Hail'){
      return 'assets/images/snow.png';
    }else if (weatherStateName == 'Heavy cloud'|| weatherStateName == 'Patchy rain possible'){
      return 'assets/images/cloudy.png';
    }else if (weatherStateName == 'Light rain'||weatherStateName == 'Moderate rain' ||weatherStateName == 'Heavy rain'
        ||weatherStateName == 'Showers' ){
      return 'assets/images/rainy.png';
    }else if (weatherStateName == 'Thunderstorm'||weatherStateName == 'Thunder'){
      return 'assets/images/thunderstorm.png';
    }else
      return 'assets/images/clear.png';

  }
  MaterialColor getTheme(){
    if(weatherStateName == 'Clear' || weatherStateName == 'Light Cloud'){
      return Colors.amber;
    }else if (weatherStateName == 'Sleet' || weatherStateName == 'Snow'
                || weatherStateName == 'Hail'){
      return Colors.blue;
    }else if (weatherStateName == 'Heavy Cloud'|| weatherStateName == 'Patchy rain possible'){
      return Colors.blueGrey;
    }else if (weatherStateName == 'Light rain'||weatherStateName == 'Moderate rain' ||weatherStateName == 'Heavy rain'
        ||weatherStateName == 'Showers' ){
      return Colors.cyan;
    }else if (weatherStateName == 'Thunderstorm'||weatherStateName == 'Thunder'){
      return Colors.grey;
    }else
      return Colors.amber;

  }
}
