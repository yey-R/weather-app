import 'network.dart';
import 'location.dart';

const apiKey = '32eda22260038fe087e2d8cb7f40b32c';
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
