import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/models/weather/weather_data.dart';

void main() {
  group('WeatherData Model', () {
    test('Debería parsear correctamente de JSON', () {
      // Ejemplo de JSON similar a la respuesta de la API
      final jsonString = '''
      {
        "location": {
          "name": "Santiago",
          "region": "RM",
          "country": "Chile",
          "lat": -33.45,
          "lon": -70.66,
          "tz_id": "America/Santiago",
          "localtime": "2025-03-29 10:00"
        },
        "current": {
          "temp_c": 25.0,
          "wind_kph": 15.0,
          "humidity": 60,
          "condition": {
            "text": "Soleado",
            "icon": "https://www.weatherapi.com/icon.png",
            "code": 1000
          }
        }
      }
      ''';

      final Map<String, dynamic> jsonMap = jsonDecode(jsonString);

      final weatherData = WeatherData.fromJson(jsonMap);

      // Verifica que los datos se han parseado correctamente
      expect(weatherData.location.location.name, "Santiago");
      expect(weatherData.location.location.region, "RM");
      expect(weatherData.location.location.country, "Chile");
      expect(weatherData.current.current.tempC, 25.0);
      expect(weatherData.current.current.windKph, 15.0);
      expect(weatherData.current.current.humidity, 60);
      expect(weatherData.current.current.condition?.text, "Soleado");
      expect(weatherData.current.current.condition?.icon, "https://www.weatherapi.com/icon.png");
      expect(weatherData.current.current.condition?.code, 1000);
    });
  });
}
