import 'package:flutter/material.dart';
import 'package:app_design/widgets/custom_box.dart';

class CustomBoxInfo extends StatelessWidget {
  final info;
  final userPref;

  CustomBoxInfo({@required this.info, @required this.userPref});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 280.0,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height - 280,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35.0),
            topRight: Radius.circular(35.0),
          ),
          color: Color(0xFFd3d7e1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                CustomBox(
                  icon: 'temp',
                  title: 'Temperature',
                  value: '${info.temp}',
                  unit: userPref.getBool('metric') ? '°C' : '°F',
                ),
                CustomBox(
                  icon: info.temp > info.feelsLike
                      ? 'temp_decrease'
                      : 'temp_increase',
                  title: 'Feels Like',
                  value: '${info.feelsLike}',
                  unit: userPref.getBool('metric') ? '°C' : '°F',
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                CustomBox(
                  icon: 'wind',
                  title: 'Wind',
                  value: '${info.windSpeed}',
                  unit: userPref.getBool('metric') ? 'km/h' : 'mph',
                ),
                CustomBox(
                  icon: 'humidity',
                  title: 'Humidity',
                  value: '${info.humidity}',
                  unit: '%',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
