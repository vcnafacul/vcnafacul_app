import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
// ignore: unused_import
import 'package:latlong2/latlong.dart' as ll;
import 'package:vcnafacul/style/colors.dart';
import 'package:vcnafacul/types/geolocation/lat_lbg.dart';

class MapOsm extends StatefulWidget {
  final LatLng center;
  const MapOsm({Key? key, required this.center}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MapOsmState createState() => _MapOsmState();
}

class _MapOsmState extends State<MapOsm> {
  late LatLng center;

  @override
  void initState() {
    center = widget.center;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: CustomColors.marine,
      ),
      width: double.infinity,
      height: 300,
      child: FlutterMap(
          options: MapOptions(initialCenter: ll.LatLng(center.lat, center.lng)),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.example.app',
            ),
            MarkerLayer(markers: [
              Marker(
                  child: SvgPicture.asset(
                    'assets/images/home/logo.svg',
                  ),
                  width: 20,
                  height: 20,
                  point: ll.LatLng(center.lat, center.lng))
            ])
          ]),
    );
  }
}
