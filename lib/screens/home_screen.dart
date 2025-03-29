import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/controller/global_controller.dart';
import 'package:weather_app/widgets/data_current_widget.dart';
import 'package:weather_app/widgets/header_widget.dart';
import 'package:weather_app/widgets/icon_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ControladorGlobal controladorGlobal = Get.put(
    ControladorGlobal(),
    permanent: true,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF47BFDF),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(''),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            color: Colors.white,
            icon: const Icon(Icons.search),
            onPressed: () {
              Get.toNamed('/search');
            },
          ),
          IconButton(
            color: Colors.white,
            icon: const Icon(Icons.map),
            onPressed: () {
              Get.toNamed('/map');
            },
          ),
          IconButton(
            color: Colors.white,
            icon: const Icon(Icons.refresh),
            onPressed: () {
              controladorGlobal.refreshData();
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF47BFDF), // Color inicial
                Color(0xFF4A91FF), // Color final
              ],
            ),
          ),
          child: Obx(
            () =>
                controladorGlobal.isLoading.isTrue
                    ? Center(child: CircularProgressIndicator())
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

                        DataCurrentWidget(),
                      ],
                    ),
          ),
        ),
      ),
    );
  }
}
