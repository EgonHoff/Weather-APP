import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather_app/api/fetch_weather.dart';
import 'package:weather_app/models/weather/weather_data.dart';

class ControladorGlobal extends GetxController {
  final RxBool _isLoading = true.obs;
  final RxDouble _lattitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;
  final FetchWeatherAPI _fetchWeatherAPI;

  RxBool get isLoading => _isLoading;
  RxDouble get lattitude => _lattitude;
  RxDouble get longitude => _longitude;

  final weatherData = Rxn<WeatherData>();

  WeatherData? getWeatherData() {
    return weatherData.value;
  }
  ControladorGlobal({FetchWeatherAPI? api})
      : _fetchWeatherAPI = api ?? FetchWeatherAPI();

  @override
  void onInit() {
    super.onInit();
    _getInitialLocation();
  }

  Future<void> _getInitialLocation() async {
    bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!isLocationServiceEnabled) {
      return Future.error(
        'Servicio de ubicación deshabilitado. Actívalo en la configuración del dispositivo.',
      );
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Permiso de ubicación denegado.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
        'Permiso denegado permanentemente. Habilítalo en la configuración.',
      );
    }

    await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 10,
      ),
    ).then((Position position) {
      _lattitude.value = position.latitude;
      _longitude.value = position.longitude;
      _fetchWeatherData(position.latitude, position.longitude);
    });
  }
  void updatePositionFromMap(double lat, double lon) {
    _lattitude.value = lat;
    _longitude.value = lon;
    _isLoading.value = true;
    _fetchWeatherData(lat, lon);
  }

  Future<void> _fetchWeatherData(double lat, double lon) async {
    return _fetchWeatherAPI
        .processData(lat: lat, lon: lon)
        .then((data) {
          weatherData.value = data;
          _isLoading.value = false;
          update();
        });
  }
  
  Future<void> fetchWeatherByCity(String cityName) async {
    try {
      var data = await _fetchWeatherAPI.processData(cityName: cityName);
      weatherData.value = data;
      update();
    } catch (e) {
      weatherData.value = null;
      rethrow;
    }
  }

  void refreshData() {
    _isLoading.value = true;
    _getInitialLocation();
  }
}

