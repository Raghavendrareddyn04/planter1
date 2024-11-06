import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';

class WeatherService {
  static const String API_KEY = '60b24eeabebdecaa73431001ee7b5a06';
  final WeatherFactory wf = WeatherFactory(API_KEY);

  Future<Position> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied');
      }
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<Weather> getWeather() async {
    try {
      Position position = await getCurrentLocation();
      Weather weather = await wf.currentWeatherByLocation(
        position.latitude,
        position.longitude,
      );
      return weather;
    } catch (e) {
      throw Exception('Failed to get weather data: $e');
    }
  }
}