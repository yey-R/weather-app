import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final int weatherCode;

  Background({@required this.weatherCode});

  String getImage() {
    if (200 <= weatherCode && weatherCode <= 232) {
      return 'thunder_2.gif';
    } else if (300 <= weatherCode && weatherCode <= 321) {
      return null;
    } else if (300 <= weatherCode && weatherCode <= 321) {
      return 'rain_2.gif';
    } else if (600 <= weatherCode && weatherCode <= 622) {
      return 'snow_9.gif';
    } else if (701 <= weatherCode && weatherCode <= 781) {
      return 'fog_2.png';
    } else if (801 <= weatherCode && weatherCode <= 804) {
      return 'fog.png';
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return getImage() != null
        ? Container(
            height: 600.0,
            child: Image.asset(
              'assets/backgrounds/sunlight_left.png',
              color: Colors.white,
              fit: BoxFit.fitHeight,
            ),
          )
        : Container();
  }
}
