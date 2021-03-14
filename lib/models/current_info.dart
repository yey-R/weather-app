import 'package:intl/intl.dart';

class WeatherInfoCurrent {
  int dayInSec;
  int temp;
  int feelsLike;
  int windSpeed;
  int humidity;
  int weatherCode;
  String description;

  WeatherInfoCurrent(dynamic data) {
    this.dayInSec = data['dt'];
    this.temp = data['temp'].round();
    this.feelsLike = data['feels_like'].round();
    this.humidity = data['humidity'];
    this.windSpeed = data['wind_speed'].round();
    this.weatherCode = data['weather'][0]['id'];
    this.description = data['weather'][0]['main'];
  }

  String getDay() {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(dayInSec * 1000);
    return DateFormat('EEEE').format(date);
  }

  String getDate() {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(dayInSec * 1000);
    return '${date.day} ${DateFormat('MMMM').format(date).substring(0, 3)} ${date.year}';
  }
}
