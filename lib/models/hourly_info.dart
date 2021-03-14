class WeatherInfoHourly {
  int temp;
  int feelsLike;
  int windSpeed;
  int humidity;
  int weatherCode;
  String description;
  int dayInSec;
  int hour;
  int day;

  WeatherInfoHourly(dynamic data, bool ifMain) {
    this.dayInSec = data['dt'];
    this.hour = DateTime.fromMillisecondsSinceEpoch(
      dayInSec * 1000,
      isUtc: true,
    ).hour;
    this.day = DateTime.fromMillisecondsSinceEpoch(
      dayInSec * 1000,
      isUtc: true,
    ).day;
    if (ifMain) {
      this.temp = data['temp'].round();
      this.feelsLike = data['feels_like'].round();
      this.humidity = data['humidity'];
      this.windSpeed = data['wind_speed'].round();
      this.weatherCode = data['weather'][0]['id'];
      this.description = data['weather'][0]['main'];
    } else {
      this.temp = data['main']['temp'].round();
      this.feelsLike = data['main']['feels_like'].round();
      this.humidity = data['main']['humidity'];
      this.windSpeed = data['wind']['speed'].round();
      this.weatherCode = data['weather'][0]['id'];
      this.description = data['weather'][0]['main'];
    }
  }

  int getHour() {
    return this.hour;
  }
}
