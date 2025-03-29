import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/controller/global_controller.dart';

class DataCurrentWidget extends StatelessWidget {
  final ControladorGlobal controlador = Get.find();

  DataCurrentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controlador.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      double? tempC = controlador.weatherData.value?.current.current.tempC;
      double? windKph = controlador.weatherData.value?.current.current.windKph;
      double? humidity = controlador.weatherData.value?.current.current.humidity;
      String? iconName = controlador.weatherData.value?.current.current.condition?.text;

      String date = DateFormat("MMMM d").format(DateTime.now());
      String formatdate = "Today, $date";

      return SizedBox(
        height: 234.23, // Altura según Figma
        width: 246.82, // Ancho según Figma
        child: Container(
          margin: const EdgeInsets.only(left: 25, right: 25),
          decoration: BoxDecoration(
            color: Color.fromARGB(100, 255, 255, 255),
            border: Border.all(color: Colors.white, width: 1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                formatdate,
                style: const TextStyle(
                  fontFamily: 'Overpass',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              Text(
                '$tempC °',
                style: const TextStyle(
                  fontFamily: 'Overpass',
                  fontSize: 60,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              Text(
                iconName!,
                style: const TextStyle(
                  fontFamily: 'Overpass',
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.air, color: Colors.white),
                  SizedBox(width: 10),
                  Text(
                    'Wind',
                    style: const TextStyle(
                      fontFamily: 'Overpass',
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 30),
                  Container(height: 13, width: 1, color: Colors.white),
                  SizedBox(width: 30),
                  Text(
                    '$windKph km/h',
                    style: const TextStyle(
                      fontFamily: 'Overpass',
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.water_drop, color: Colors.white),
                  SizedBox(width: 10),
                  Text(
                    'Humidity',
                    style: const TextStyle(
                      fontFamily: 'Overpass',
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 30),
                  Container(height: 13, width: 1, color: Colors.white),
                  SizedBox(width: 30),
                  Text(
                    '$humidity %',
                    style: const TextStyle(
                      fontFamily: 'Overpass',
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
