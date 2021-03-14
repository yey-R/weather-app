import 'package:intl/intl.dart';

class WeatherInfoDaily {
  int dayInSec;
  int temp;
  int tempMin;
  int tempMax;
  int feelsLike;
  int windSpeed;
  int humidity;
  int weatherCode;
  String description;

  WeatherInfoDaily(dynamic data) {
    this.dayInSec = data['dt'];
    this.temp = data['temp']['day'].round();
    this.tempMin = data['temp']['min'].round();
    this.tempMax = data['temp']['max'].round();
    this.feelsLike = data['feels_like']['day'].round();
    this.humidity = data['humidity'];
    this.windSpeed = data['wind_speed'].round();
    this.weatherCode = data['weather'][0]['id'];
    this.description = data['weather'][0]['main'];
  }

  String getDay() {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(dayInSec * 1000);
    return DateFormat('EEEE').format(date);
  }

  String getMonthAndDay() {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(dayInSec * 1000);
    return '${date.day} ${DateFormat('MMM').format(date)}';
  }

  String getDate() {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(dayInSec * 1000);
    return '${date.day} ${DateFormat('MMMM').format(date).substring(0, 3)} ${date.year}';
  }
}
