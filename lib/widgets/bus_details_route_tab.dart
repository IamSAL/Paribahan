import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import '../entities/common_entity.dart';
import "package:latlong2/latlong.dart";

class BusDetailsRouteTab extends StatelessWidget {
  const BusDetailsRouteTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            padding: EdgeInsets.symmetric(vertical: 00, horizontal: 00),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: FlutterMap(
              options: MapOptions(
                center: LatLng(23.8103, 90.4125),
                zoom: 9.2,
              ),
              nonRotatedChildren: [],
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.app',
                ),
              ],
            )),
        Container(
          height: 90,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white.withOpacity(0.9),
                Colors.white.withOpacity(0.25),
                Colors.white.withOpacity(0.05),
              ],
            ),
          ),
        )
      ],
    );
  }
}
