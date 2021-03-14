import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconInfo {
  int hour = -1;
  bool night = false;

  IconInfo({this.hour});

  void checkTime() {
    if (hour == -1) {
      night = false;
      return;
    }
    this.hour =
        DateTime.fromMillisecondsSinceEpoch(this.hour * 1000, isUtc: true).hour;
    if (hour > 18 || hour <= 6) {
      night = true;
    } else if (hour > 6 && hour <= 18) {
      night = false;
    }
  }

  SvgPicture getIcon(int condition, Color color) {
    checkTime();
    if (200 <= condition && condition <= 232) {
      return SvgPicture.asset(
        'assets/icons/weather/thunderstorm.svg',
        color: color,
      );
    } else if (300 <= condition && condition <= 321) {
      return SvgPicture.asset(
        'assets/icons/weather/shower_rain_day.svg',
        color: color,
      );
    } else if (500 <= condition && condition <= 504) {
      return !night
          ? SvgPicture.asset(
              'assets/icons/weather/rain_day.svg',
              color: color,
            )
          : SvgPicture.asset(
              'assets/icons/weather/rain_night.svg',
              color: color,
            );
    } else if (condition == 511) {
      return SvgPicture.asset(
        'assets/icons/weather/freezing_rain.svg',
        color: color,
      );
    } else if (520 <= condition && condition <= 531) {
      return !night
          ? SvgPicture.asset(
              'assets/icons/weather/shower_rain_day.svg',
              color: color,
            )
          : SvgPicture.asset(
              'assets/icons/weather/shower_rain_night.svg',
              color: color,
            );
    } else if (600 <= condition && condition <= 622) {
      return SvgPicture.asset(
        'assets/icons/weather/snow.svg',
        color: color,
      );
    } else if (700 <= condition && condition <= 781) {
      return SvgPicture.asset(
        'assets/icons/weather/mist.svg',
        color: color,
      );
    } else if (condition == 800) {
      return !night
          ? SvgPicture.asset(
              'assets/icons/weather/clear_day.svg',
              color: color,
            )
          : SvgPicture.asset(
              'assets/icons/weather/clear_night.svg',
              color: color,
            );
    } else if (condition == 801) {
      return !night
          ? SvgPicture.asset(
              'assets/icons/weather/few_clouds_day.svg',
              color: color,
            )
          : SvgPicture.asset(
              'assets/icons/weather/few_clouds_night.svg',
              color: color,
            );
    } else if (condition == 802) {
      return SvgPicture.asset(
        'assets/icons/weather/scattered_clouds.svg',
        color: color,
      );
    } else if (condition == 803 || condition == 804) {
      return SvgPicture.asset(
        'assets/icons/weather/broken_clouds.svg',
        color: color,
      );
    } else {
      return null;
    }
  }
}
