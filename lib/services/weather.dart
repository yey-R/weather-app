import 'network.dart';
import 'location.dart';

const apiKey = '{API KEY}';
const openWeatherURL = 'https://api.openweathermap.org/data/2.5/forecast';

class Weather {
  Future<dynamic> getCityWeather(String cityName) async {
    Network networkHelper = Network(
        url: '$openWeatherURL?q=$cityName,tr&appid=$apiKey&units=metric');
    return await networkHelper.getData();
  }

  Future<dynamic> getWeatherData() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(
        '$openWeatherURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    Network networkHelper = Network(
        url:
            '$openWeatherURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    return await networkHelper.getData();
  }
}
