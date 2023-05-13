import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class AssetTileProvider extends TileProvider {
  final String assetPath;

  AssetTileProvider(this.assetPath);

  @override
  FutureOr<ImageProvider> getImage(Coords coords, TileLayerOptions options) {
    final path = '$assetPath/${coords.z}/${coords.x}/${coords.y}.jpg';
    return AssetImage(path);
  }
}

class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map'),
      ),
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(37.7749, -122.4194),
          zoom: 13.0,
        ),
        layers: [
          TileLayerOptions(
            urlTemplate: 'assets/tile/{z}/{x}/{y}.jpg',
            tileProvider: AssetTileProvider('assets/tile'),
          ),
        ],
      ),
    );
  }
}

