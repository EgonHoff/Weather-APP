import 'package:weather_app/models/weather/weather_data_current.dart';
import 'package:weather_app/models/weather/weather_data_location.dart';

class WeatherData {
  final LocationCurrent location;
  final WeatherDataCurrent current;

  WeatherData({required this.location, required this.current});

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      location: LocationCurrent.fromJson(json['location']),
      current: WeatherDataCurrent.fromJson(json['current']),
    );
  }
}
