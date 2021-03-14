import 'package:app_design/screens/weather_screen.dart';
import 'package:app_design/services/weather_forecast.dart';
import 'package:app_design/services/weather_onecall.dart';
import 'package:flutter/material.dart';
import 'package:app_design/services/location.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    Location location = Location();
    SharedPreferences userPref = await SharedPreferences.getInstance();
    if (userPref.getKeys().isEmpty) {
      userPref.setBool('metric', true);
      userPref.setBool('24h', true);
    }
    bool isMetric = userPref.getBool('metric');
    var oneCallData = await WeatherOneCall(isMetric).getWeatherData(location);
    var foreCastData = await WeatherForeCast(isMetric).getWeatherData(location);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return WeatherScreen(
            foreCastData: foreCastData,
            oneCallData: oneCallData,
            location:
                '${location.addressInfo.first.subAdminArea}, ${location.addressInfo.first.adminArea}',
            userPref: userPref,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          'assets/images/loading.gif',
          repeat: ImageRepeat.repeat,
        ),
      ),
    );
  }
}
