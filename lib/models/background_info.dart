import 'package:flutter/material.dart';

class BackgroundInfo {
  Image getIcon(int condition, Color color) {
    if (200 <= condition && condition <= 232) {
      return Image.asset('thunderstorm');
    } else if (300 <= condition && condition <= 321) {
      return Image.asset('shower_rain_day');
    } else if (500 <= condition && condition <= 504) {
      return Image.asset('rain_day');
    } else if (condition == 511) {
      return Image.asset('freezing_rain');
    } else if (520 <= condition && condition <= 531) {
      return Image.asset('shower_rain_night');
    } else if (600 <= condition && condition <= 622) {
      return Image.asset('snow');
    } else if (700 <= condition && condition <= 781) {
      return Image.asset('mist');
    } else if (condition == 800) {
      return Image.asset('clear_day');
    } else if (condition == 801) {
      return Image.asset('few_clouds');
    } else if (condition == 802) {
      return Image.asset('scattered_clouds');
    } else if (condition == 803 || condition == 804) {
      return Image.asset('broken_clouds');
    } else {
      return null;
    }
  }
}
