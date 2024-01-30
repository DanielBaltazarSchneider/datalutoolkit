import 'package:geolocator/geolocator.dart';

class GeolocatorApp {
  late bool serviceEnabled;
  late LocationPermission permission;
  Future<void> initialize() async {
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {}
    }
  }

  Future<({double lat, double lng})?> determinePosition() async {
    try {
      Position position = await Geolocator.getCurrentPosition();
      return (lat: position.latitude, lng: position.longitude);
    } catch (e) {
      return null;
    }
  }
}
