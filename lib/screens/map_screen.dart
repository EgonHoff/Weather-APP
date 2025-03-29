import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:weather_app/controller/global_controller.dart';
import 'package:weather_app/widgets/data_current_widget_map.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final ControladorGlobal controladorGlobal = Get.put(
    ControladorGlobal(),
    permanent: true,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controladorGlobal.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return Stack(
          children: [
            FlutterMap(
              options: MapOptions(
                initialCenter: LatLng( // Usamos LatLng para definir el centro
                  controladorGlobal.lattitude.value,
                  controladorGlobal.longitude.value,
                ),
                initialZoom: 4, // Establecemos el zoom
                onTap: (tapPosition, point) {
                  // Actualiza la posición cuando tocas el mapa
                  controladorGlobal.updatePositionFromMap(point.latitude, point.longitude);
                },
              ),
              children: [
                TileLayer(
                  urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                ),
              ],
            ),
            Positioned(
              top: 50,
              left: 20,
              right: 20,
              child: DataCurrentWidgetMap(),
            ),
            // Botón flotante en la parte inferior de la pantalla
            Positioned(
              bottom: 20,
              right: 20,
              child: FloatingActionButton(
                onPressed: () {
                  // Navegar de vuelta a la pantalla anterior (HomeScreen)
                  Get.offAllNamed('/');
                  controladorGlobal.refreshData();
                },
                backgroundColor: Colors.white,
                child: const Icon(Icons.arrow_back),
              ),
            ),
          ],
        );
      }),
    );
  }
}


