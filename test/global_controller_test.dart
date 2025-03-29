import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_app/controller/global_controller.dart';
import 'package:weather_app/models/weather/weather_data.dart';
import 'package:weather_app/models/weather/weather_data_current.dart';
import 'package:weather_app/models/weather/weather_data_location.dart';
import 'mocks.mocks.dart';

void main() {
  late ControladorGlobal controller;
  late MockFetchWeatherAPI mockFetchWeatherAPI;

  setUp(() {
    mockFetchWeatherAPI = MockFetchWeatherAPI();
    // Inyecta el mock al controlador
    controller = ControladorGlobal(api: mockFetchWeatherAPI);
  });

  group('Pruebas de ControladorGlobal', () {
    test('Debe actualizar la ubicación y llamar a la API', () async {
      when(mockFetchWeatherAPI.processData(lat: anyNamed('lat'), lon: anyNamed('lon')))
          .thenAnswer((_) async => WeatherData(
                location: LocationCurrent(
                  location: Location(
                    name: "Santiago",
                    region: "RM",
                    country: "Chile",
                    lat: -33.45,
                    lon: -70.66,
                    tzId: "America/Santiago",
                    localtime: "2025-03-29 10:00",
                  ),
                ),
                current: WeatherDataCurrent(
                  current: Current(
                    tempC: 25.0,
                    windKph: 15.0,
                    humidity: 60.0,
                    condition: Condition(
                      text: "Soleado",
                      icon: "https://www.weatherapi.com/icon.png",
                      code: 1000,
                    ),
                  ),
                ),
              ));

      controller.updatePositionFromMap(10.0, 20.0);

      expect(controller.lattitude.value, 10.0);
      expect(controller.longitude.value, 20.0);
    });

    test('Debe actualizar el clima por ciudad', () async {
      when(mockFetchWeatherAPI.processData(cityName: anyNamed('cityName')))
          .thenAnswer((_) async => WeatherData(
                location: LocationCurrent(
                  location: Location(
                    name: "Santiago",
                    region: "RM",
                    country: "Chile",
                    lat: -33.45,
                    lon: -70.66,
                    tzId: "America/Santiago",
                    localtime: "2025-03-29 10:00",
                  ),
                ),
                current: WeatherDataCurrent(
                  current: Current(
                    tempC: 25.0,
                    windKph: 15.0,
                    humidity: 60.0,
                    condition: Condition(
                      text: "Soleado",
                      icon: "https://www.weatherapi.com/icon.png",
                      code: 1000,
                    ),
                  ),
                ),
              ));

      await controller.fetchWeatherByCity("Santiago");

      expect(controller.getWeatherData(), isNotNull);
    });
  });
}

