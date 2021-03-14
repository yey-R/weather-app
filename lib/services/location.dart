import 'package:geolocator/geolocator.dart';
import 'package:geocoder/geocoder.dart';

class Location {
  double latitude;
  double longitude;
  List<Address> addressInfo;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      latitude = position.latitude;
      longitude = position.longitude;
      Coordinates coords = Coordinates(latitude, longitude);
      addressInfo = await Geocoder.local.findAddressesFromCoordinates(coords);
    } catch (e) {
      print(e);
    }
  }
}
