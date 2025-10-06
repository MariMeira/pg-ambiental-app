import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'dart:async';
import 'mapa_controller.dart';
import 'mapa_widgets.dart';

class MapaPage extends StatefulWidget {
  final String endereco;
  final String? tipoColeta;
  final bool? mostrarPEVs;
  final bool? mostrarAssociacoes;
  final LatLng? marcadorEspecial;
  final String? tituloMarcador;
  final int? abaInicial;

  const MapaPage({...});

  @override
  State<MapaPage> createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> with SingleTickerProviderStateMixin {
  final MapaController _controller = MapaController();
  late TabController _tabController;
  double _progressoCarregamento = 0.0;
  bool _mostrarProgresso = true;
  late StreamSubscription<double> _progressoSubscription;

  @override
  void initState() {...}

  @override
  void dispose() {...}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _controller.corBranco,
      appBar: AppBar(...),
      body: Stack(
        children: [
          TabBarView(
            controller: _tabController,
            children: [_buildMapaDomiciliar(), _buildMapaSeletiva()],
          ),
          if (_mostrarProgresso) _buildLoadingOverlay(),
        ],
      ),
    );
  }

  Widget _buildLoadingOverlay() {...}
  String _getTextoProgresso(double progresso) {...}
  Widget _buildCustomTabBar() {...}
  Widget _buildMapaDomiciliar() {...}
  Widget _buildMapaSeletiva() {...}
}