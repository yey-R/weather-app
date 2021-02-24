import 'package:flutter/material.dart';
import 'package:weather_app/screens/weather_screen.dart';
import 'package:weather_app/services/weather.dart';

const apiKey = '32eda22260038fe087e2d8cb7f40b32c';
const openWeatherURL = 'https://api.openweathermap.org/data/2.5/forecast';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    var weatherData = await Weather().getWeatherData();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return WeatherScreen(
            data: weatherData,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
