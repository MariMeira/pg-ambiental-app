import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';
import 'mapa_controller.dart';
import 'filtros_panel.dart';

class MapaWidgets {
  static Widget buildMapaDomiciliar({
    required BuildContext context,
    required MapaController controller,
    required dynamic widget,
    required VoidCallback onStateUpdate,
  }) {
    return Stack(
      children: [
        Listener(
          onPointerDown: (_) {...},
          child: FlutterMap(
            mapController: controller.mapController,
            options: MapOptions(...),
            children: [
              TileLayer(...),
              PolygonLayer(polygons: controller.visiblePolygons),
              MarkerLayer(markers: controller.kmlMarkers),
              MarkerLayer(markers: controller.enderecosMarkers),
              if (controller.userLocation != null)
                MarkerLayer(...),
              _buildClickMarker(controller),
            ],
          ),
        ),
        Positioned(bottom: 20, right: 10, child: _buildCustomZoomButtons(controller)),
        Positioned(top: 10, left: 10, child: _buildSearchBar(controller, widget)),
        FiltrosPanel.buildPanelLateral(context, controller, onStateUpdate),
        _buildInfoWindow(controller, onStateUpdate),
      ],
    );
  }

  static Widget buildMapaSeletiva({
    required BuildContext context,
    required MapaController controller,
    required dynamic widget,
    required VoidCallback onStateUpdate,
  }) {
    return Stack(
      children: [
        Listener(
          onPointerDown: (_) {...},
          child: FlutterMap(
            mapController: controller.mapController,
            options: MapOptions(...),
            children: [
              TileLayer(...),
              PolygonLayer(polygons: polygonsVisiveis),
              PolylineLayer(polylines: polylinesVisiveis),
              MarkerLayer(markers: markersVisiveis),
              MarkerLayer(markers: associacoesMarkersVisiveis),
              MarkerLayer(markers: controller.enderecosMarkers),
              if (controller.userLocation != null)
                MarkerLayer(...),
              _buildClickMarker(controller),
            ],
          ),
        ),
        Positioned(bottom: 20, right: 10, child: _buildCustomZoomButtons(controller)),
        Positioned(top: 10, left: 10, child: _buildSearchBar(controller, widget)),
        FiltrosPanel.buildPanelLateral(context, controller, onStateUpdate),
        _buildInfoWindow(controller, onStateUpdate),
      ],
    );
  }

  static Widget _buildLoadingIndicator(MapaController controller) {...}
  static Widget _buildCustomZoomButtons(MapaController controller) {...}
  static Widget _buildSearchBar(MapaController controller, dynamic widget) {...}
  static Widget _buildClickMarker(MapaController controller) {...}
  static Color _getCorMarcador(MapaController controller) {...}
  static Widget _buildInfoWindow(MapaController controller, VoidCallback onStateUpdate) {...}
  static Widget _buildInfoPopup(MapaController controller, VoidCallback onStateUpdate,
      {required String titulo, required Widget conteudo, LatLng? localizacao, String? endereco}) {...}
  static Widget _buildBotaoRota(LatLng localizacao, String endereco, MapaController controller) {...}
  static Future<void> _abrirRotaNoMaps(LatLng localizacao, String endereco) async {...}
  static void _fecharPopup(MapaController controller, VoidCallback onStateUpdate) {...}
}