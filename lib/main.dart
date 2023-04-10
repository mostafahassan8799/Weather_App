import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weathers/models/weather_model.dart';
import 'package:weathers/pages/home_page.dart';
import 'package:weathers/providers/weather_provider.dart';
 void main(){
   runApp(ChangeNotifierProvider(
       create: (BuildContext context) {
         return WeatherProvider();
       },
       child: WeatherApp()));
 }
class WeatherApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme : ThemeData(
        primarySwatch: Provider.of<WeatherProvider>(context).weatherData == null ? Colors.blue
            : Provider.of<WeatherProvider>(context).weatherData!.getTheme(),
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
