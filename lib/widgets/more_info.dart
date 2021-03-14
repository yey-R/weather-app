import 'package:flutter/material.dart';

class MoreInfo extends StatelessWidget {
  final int wind;
  final int feelsLike;
  final int humidity;
  final bool isMetric;

  MoreInfo({
    @required this.wind,
    @required this.feelsLike,
    @required this.humidity,
    @required this.isMetric,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Text(
              'Wind',
              style: TextStyle(
                color: Colors.white60,
                fontSize: 20.0,
              ),
            ),
            Row(
              children: [
                Text(
                  '$wind',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35.0,
                  ),
                ),
              ],
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(left: 18.0, right: 18.0),
          color: Colors.white60,
          height: 40,
          width: 1,
        ),
        Column(
          children: [
            Text(
              'Feels Like',
              style: TextStyle(
                color: Colors.white60,
                fontSize: 20.0,
              ),
            ),
            Text(
              isMetric ? '$feelsLike°C' : '$feelsLike°F',
              style: TextStyle(
                color: Colors.white,
                fontSize: 35.0,
              ),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(left: 18.0, right: 18.0),
          color: Colors.white60,
          height: 40,
          width: 1,
        ),
        Column(
          children: [
            Text(
              'Humidity',
              style: TextStyle(
                color: Colors.white60,
                fontSize: 20.0,
              ),
            ),
            Text(
              '$humidity%',
              style: TextStyle(
                color: Colors.white,
                fontSize: 35.0,
              ),
            ),
          ],
        )
      ],
    );
  }
}
