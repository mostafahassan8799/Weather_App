import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weathers/models/weather_model.dart';
import 'package:weathers/providers/weather_provider.dart';
import 'package:weathers/services/weather_services.dart';

class SearchPage extends StatelessWidget {
  String? cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Enter City",
              border: OutlineInputBorder(),
              label: Text("search"),
              prefixIcon: Icon(Icons.search),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 28, horizontal: 16),
            ),
            style: TextStyle(fontSize: 16),
            cursorColor: Colors.orange,
            onSubmitted: (data) async {
              cityName = data;
              WeatherService service = WeatherService();
              WeatherModel weather = await service.getWeather(cityName!);
              Provider.of<WeatherProvider>(context, listen: false).weatherData =
                  weather;
              Provider.of<WeatherProvider>(context, listen: false).cityName =
                  cityName;
              Navigator.pop(context);
              print(weather);
            },
          ),
        ),
      ),
    );
  }
}
