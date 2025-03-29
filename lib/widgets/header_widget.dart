import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/controller/global_controller.dart';

class HeaderWidget extends StatelessWidget {
  final ControladorGlobal controlador = Get.find();

  HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controlador.isLoading.value) {
        return const CircularProgressIndicator();
      }

      String? locationName = controlador.weatherData.value?.location.location.name;
      String? country = controlador.weatherData.value?.location.location.country;

      return Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            alignment: Alignment.topLeft,
            child: Row(
              children: [
                Icon(Icons.location_on, color: Colors.white), // Icono de GPS
                const SizedBox(width: 5),
                Text(
                  '$locationName,' '',
                  style: const TextStyle(
                    fontFamily: 'Overpass',
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 10),
                Text(country ?? '',
                  style: const TextStyle(
                    fontFamily: 'Overpass',
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}
