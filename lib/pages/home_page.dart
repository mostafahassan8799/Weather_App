import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weathers/models/weather_model.dart';
import 'package:weathers/pages/search_page.dart';
import 'package:weathers/providers/weather_provider.dart';


class HomePage extends StatefulWidget {


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherModel? weatherData;
  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<WeatherProvider>(context).weatherData;
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather App"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SearchPage();
                }));
              },
              icon: Icon(Icons.search)),
        ],
      ),
      body: weatherData == null
          ? Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'there is no weather 😔 ',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            Text(
              'start searching now 🔍',
              style: TextStyle(
                fontSize: 30,
              ),
            )
          ],
        ),
      )
          : Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    weatherData!.getTheme(),
                    weatherData!.getTheme()[300]!,
                    weatherData!.getTheme()[100]!,
                  ],
                  begin: Alignment.topCenter ,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    Provider.of<WeatherProvider>(context).cityName!,
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('updated at ${weatherData!.date}'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(weatherData!.getImage()),
                      Text(
                        "${weatherData!.temp.toInt()}° C",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            "maxTemp =${weatherData!.max_temp.toInt()}° C",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "minTemp = ${weatherData!.min_temp.toInt()}° C",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    weatherData!.weatherStateName,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
