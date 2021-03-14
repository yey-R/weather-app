import 'network.dart';
import 'location.dart';

const apiKey = '{API-KEY}';
const openWeatherURL = 'https://api.openweathermap.org/data/2.5/onecall';

class WeatherOneCall {
  bool isMetric;

  WeatherOneCall(bool isMetric) {
    this.isMetric = isMetric;
  }

  Future<dynamic> getCityWeather(String cityName) async {
    Network networkHelper = Network(
        url: '$openWeatherURL?q=$cityName,tr&appid=$apiKey&units=${getUnit()}');
    return await networkHelper.getData();
  }

  Future<dynamic> getWeatherData(Location location) async {
    await location.getCurrentLocation();
    print(
        '$openWeatherURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=${getUnit()}');
    Network networkHelper = Network(
        url:
            '$openWeatherURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=${getUnit()}');
    return await networkHelper.getData();
  }

  String getUnit() {
    return isMetric ? 'metric' : 'imperial';
  }
}
