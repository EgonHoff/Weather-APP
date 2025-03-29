import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/controller/global_controller.dart';

class WeatherIconWidget extends StatelessWidget {
  final ControladorGlobal controlador = Get.find();

  WeatherIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controlador.isLoading.value) {
        return const CircularProgressIndicator();
      }

      String? iconName = controlador.weatherData.value?.current.current.condition?.text ?? "default";
      iconName = iconName.replaceAll(" ", "_");

      return Column(
        children: [
          Container(
            height: 120,
            width: 118,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(73.76),
                topRight: Radius.circular(73.76),
                bottomRight: Radius.circular(73.76),
              ),
            ),
            child: Image.asset(
              'assets/images/$iconName.png',
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.error, size: 50, color: Colors.red),
            ),
          ),
        ],
      );
    });
  }
}

