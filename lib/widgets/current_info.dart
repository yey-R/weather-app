import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CurrentInfo extends StatelessWidget {
  final int dayInSec;
  final int temperature;
  final String description;
  final int weatherCode;
  final bool isMetric;

  CurrentInfo({
    @required this.dayInSec,
    @required this.temperature,
    @required this.description,
    @required this.weatherCode,
    @required this.isMetric,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            SizedBox(
              width: 20.0,
            ),
            SvgPicture.asset(
              'assets/images/people/clear_day_1.svg',
              fit: BoxFit.fitWidth,
              width: 180.0,
              alignment: Alignment.topCenter,
            ),
          ],
        ),
        Positioned(
          right: 50.0,
          top: 80.0,
          child: Column(
            children: [
              Text(
                isMetric ? '$temperature°C' : '$temperature°F',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50.0,
                ),
              ),
              Text(
                description,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                ),
              ),
            ],
          ),
        ),
        Container(),
      ],
    );
  }
}
