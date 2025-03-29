import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/controller/global_controller.dart';
import 'package:weather_app/widgets/data_current_widget.dart';
import 'package:weather_app/widgets/header_widget.dart';
import 'package:weather_app/widgets/icon_widget.dart';

class CitySearchScreen extends StatefulWidget {
  const CitySearchScreen({super.key});

  @override
  State<CitySearchScreen> createState() => _CitySearchScreenState();
}

class _CitySearchScreenState extends State<CitySearchScreen> {
  final ControladorGlobal controladorGlobal = Get.put(
    ControladorGlobal(),
    permanent: true,
  );
  final TextEditingController _cityController = TextEditingController();

  Future<void> _searchCityWeather() async {
    if (_cityController.text.isEmpty) return;

    controladorGlobal.isLoading.value = true;

    try {
      await controladorGlobal.fetchWeatherByCity(_cityController.text);
    } catch (e) {
      Get.snackbar(
        "Error",
        "No se pudo obtener el clima para la ciudad ingresada",
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      controladorGlobal.isLoading.value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF47BFDF),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(),
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            controller: _cityController,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: 'Buscar ciudad...',
              hintStyle: const TextStyle(color: Colors.white54),
              border: InputBorder.none,
              suffixIcon: IconButton(
                icon: const Icon(Icons.search, color: Colors.white),
                onPressed: _searchCityWeather,
              ),
            ),
            onSubmitted: (value) => _searchCityWeather(),
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                const Color(0xFF47BFDF), // Color inicial
                const Color(0xFF4A91FF), // Color final
              ],
            ),
          ),
          child: Obx(
            () =>
                controladorGlobal.isLoading.isTrue
                    ? const Center(child: CircularProgressIndicator())
                    : ListView(
                        scrollDirection: Axis.vertical,
                        children: [
                          SizedBox(height: 20),

                          // Widget para el encabezado
                          HeaderWidget(),

                          SizedBox(height: 70),

                          // Widget para el icono del clima
                          WeatherIconWidget(),

                          SizedBox(height: 70),

                          // Mostrar los datos del clima
                          DataCurrentWidget(),
                        ],
                      ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.offAllNamed('/'); // Navega hacia la pantalla principal (HomeScreen)
          controladorGlobal.refreshData(); // Refresca los datos
        },
        backgroundColor: Colors.lightBlue,
        child: const Icon(
          Icons.home,
          color: Colors.white,
        ),
      ),
    );
  }
}

