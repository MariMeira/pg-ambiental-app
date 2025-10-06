import 'dart:math';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geocoding/geocoding.dart';
import 'package:vector_math/vector_math.dart' as vm;
import 'data_service.dart';
import 'kml_data_service.dart';
import 'endereco_model.dart';

class MapaController {
  bool filtrosSeletivaPevExpanded = true;
  bool filtrosSeletivaAssociacoesExpanded = true;
  bool filtrosSeletivaSetoresExpanded = true;
  final Map<String, bool> filtrosCategoriasExpanded = {};

  bool mostrandoDetalhesPev = false;
  PontoEntregaVoluntaria? pevDetalhado;
  bool mostrandoDetalhesAssociacao = false;
  AssociacaoCatadores? associacaoDetalhada;
  bool mostrandoDetalhesSetorDomiciliar = false;
  Setor? setorDomiciliarDetalhado;
  bool mostrandoDetalhesSetorSeletiva = false;
  SetorColetaSeletiva? setorSeletivaDetalhado;

  bool primeiroCliquePev = true;
  bool primeiroCliqueAssociacao = true;
  bool primeiroCliqueSetorDiurno = true;
  bool primeiroCliqueSetorNoturno = true;

  final MapController mapController = MapController();
  LatLng? userLocation;
  late TabController tabController;
  final TextEditingController searchController = TextEditingController();

  final List<Marker> kmlMarkers = [];
  final List<Polygon> kmlPolygons = [];
  List<Polygon> visiblePolygons = [];
  final Map<String, List<Setor>> setoresPorCategoria = {};
  final Map<String, Color> coresCategorias = {};
  final Map<String, bool> categoriasVisiveis = {};
  final Map<String, bool> setoresVisiveis = {};

  final List<Marker> pevMarkers = [];
  final List<Polygon> setoresSeletivaPolygons = [];
  final List<Polyline> setoresSeletivaPolylines = [];
  List<PontoEntregaVoluntaria> pevs = [];
  List<SetorColetaSeletiva> setoresSeletiva = [];
  final Map<String, bool> pevsVisiveis = {};
  final Map<String, bool> setoresSeletivaVisiveis = {};

  List<AssociacaoCatadores> associacoes = [];
  final List<Marker> associacoesMarkers = [];
  final Map<String, bool> associacoesVisiveis = {};

  bool panelAberto = false;
  int abaAtiva = 0;
  bool primeiroCliqueDomiciliar = true;
  bool dadosCarregados = false;
  bool mapaInicializado = false;

  Setor? setorSelecionado;
  PontoEntregaVoluntaria? pevSelecionado;
  AssociacaoCatadores? associacaoSelecionada;
  SetorColetaSeletiva? setorSeletivaSelecionado;
  LatLng? pontoClique;

  List<EnderecoComMarcador> enderecosCadastrados = [];
  final List<Marker> enderecosMarkers = [];
  String? enderecoPadraoId;
  EnderecoComMarcador? enderecoSelecionado;
  bool mostrandoDetalhesEndereco = false;
  EnderecoComMarcador? enderecoDetalhado;

  final Color corPrimaria = const Color(0xFF2E7D32);
  final Color corVerdeEscuro = const Color(0xFF1B5E20);
  final Color corBranco = const Color(0xFFFFFFFF);
  final Color corTexto = const Color(0xFF333333);
  final Color corSecundaria = const Color(0xFF4CAF50);
  final Color corDestaque = const Color(0xFF2196F3);
  final Color corCinzaClaro = const Color(0xFFF5F5F5);
  final Color corFundo = const Color(0xFFFFFFFF);

  double paddingPadrao = 16.0;
  double marginPadrao = 8.0;
  final Duration duracaoAnimacaoPadrao = const Duration(milliseconds: 300);
  final Curve curvaAnimacaoPadrao = Curves.easeInOut;

  bool _dadosDomiciliaresCarregados = false;
  bool _dadosSeletivosCarregados = false;
  final _carregamentoStreamController = StreamController<double>.broadcast();
  Stream<double> get progressoCarregamento => _carregamentoStreamController.stream;

  void init(TickerProvider vsync, dynamic widget, TabController? tabController) async {...}
  void moverMapaParaLocalizacao(LatLng localizacao, double zoom) {...}
  void processarCliqueNoMapa(LatLng ponto, int abaAtiva) {...}
  void selecionarViaLegenda() {...}
  void inicializarParametrosResponsivos(BuildContext context) {...}
  Future<void> _carregarDadosKmlIncremental() async {...}
  Future<void> _processarDadosDomiciliares() async {...}
  Future<void> _processarDadosSeletivos() async {...}
  Future<void> _processarPevsEmChunks() async {...}
  Future<void> _processarAssociacoesEmChunks() async {...}
  Future<void> _processarSetoresSeletivosEmChunks() async {...}
  Marker _criarMarcadorPev(PontoEntregaVoluntaria pev) {...}
  Marker _criarMarcadorAssociacao(AssociacaoCatadores associacao) {...}
  Marker _criarMarcadorEndereco(EnderecoComMarcador endereco) {...}
  void _processarCliqueEndereco(EnderecoComMarcador endereco) {...}
  bool dadosParaAbaAtivaCarregados() {...}
  Color getCorCategoria(String categoria) {...}
  void atualizarPoligonosVisiveis() {...}
  Polygon? _encontrarPoligonoDoSetor(Setor setor) {...}
  bool _poligonosSaoIguais(List<LatLng> pontos1, List<LatLng> pontos2) {...}
  void toggleTodosPevs(bool visivel) {...}
  void toggleTodasAssociacoes(bool visivel) {...}
  void selecionarApenasPev(String codigoPev) {...}
  void selecionarApenasAssociacao(String codigoAssociacao) {...}
  void toggleTodosSetoresDaCategoria(String categoria, bool visivel) {...}
  void toggleSetor(String nomeSetor, bool visivel) {...}
  bool isPointInPolygon(LatLng point, List<LatLng> polygon) {...}
  Setor? encontrarSetorNoPonto(LatLng ponto) {...}
  PontoEntregaVoluntaria? encontrarPevNoPonto(LatLng ponto, [double raioMetros = 100]) {...}
  AssociacaoCatadores? encontrarAssociacaoNoPonto(LatLng ponto, [double raioMetros = 100]) {...}
  SetorColetaSeletiva? encontrarSetorSeletivaNoPonto(LatLng ponto) {...}
  EnderecoComMarcador? _encontrarEnderecoNoPonto(LatLng ponto) {...}
  double calcularDistancia(LatLng ponto1, LatLng ponto2) {...}
  List<SetorColetaSeletiva> getSetoresDiurnos() {...}
  List<SetorColetaSeletiva> getSetoresNoturnos() {...}
  void toggleTodosSetoresDiurnos(bool visivel) {...}
  void toggleTodosSetoresNoturnos(bool visivel) {...}
  void selecionarApenasSetorDiurno(String codigoSetor) {...}
  void selecionarApenasSetorNoturno(String codigoSetor) {...}
  bool todosSetoresDaCategoriaMarcados(String categoria) {...}
  bool todosPevsMarcados() {...}
  bool todasAssociacoesMarcadas() {...}
  bool todosSetoresDiurnosMarcados() {...}
  bool todosSetoresNoturnosMarcados() {...}
  void atualizarMarcadoresEnderecos(List<EnderecoComMarcador> enderecos) {...}
  void definirEnderecoPadrao(String enderecoId) {...}
  EnderecoComMarcador? encontrarEnderecoPorId(String id) {...}
  void adicionarEndereco(EnderecoComMarcador endereco) {...}
  void removerEndereco(String id) {...}
  LatLng calcularCentroPoligono(List<LatLng> pontos) {...}
  String formatarNomeSetor(String nome) {...}
  Future<LatLng?> geocodeAddress(String endereco) async {...}
  Future<String> reverseGeocode(LatLng coordenadas) async {...}
  void searchAddress(String endereco) async {...}
  void dispose() {...}
}