import 'dart:convert';
import 'package:weather_app/models/weather/weather_data.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/api/api_key.dart';

class FetchWeatherAPI {
  WeatherData? weatherData;

  Future<WeatherData> processData({String? cityName, double? lat, double? lon}) async {
    String url;

    if (cityName != null) {
      // URL para buscar por ciudad
      url = "https://api.weatherapi.com/v1/current.json?q=$cityName&key=$apiKey";
    } else if (lat != null && lon != null) {
      // URL para buscar por coordenadas
      url = "https://api.weatherapi.com/v1/current.json?q=$lat%2C%20$lon&key=$apiKey";
    } else {
      throw Exception("Se requiere una ciudad o coordenadas.");
    }

    var response = await http.get(Uri.parse(url), headers: {
      'Cache-Control': 'no-cache',
      'Pragma': 'no-cache',
    });

    if (response.statusCode == 200) {
      var jsonString = jsonDecode(response.body);
      weatherData = WeatherData.fromJson(jsonString);
      return weatherData!;
    } else {
      throw Exception('No se pudo cargar el clima');
    }
  }
}


