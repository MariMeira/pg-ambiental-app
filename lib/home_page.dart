import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:geocoding/geocoding.dart';
import 'package:latlong2/latlong.dart';
import 'dart:async';
import 'dart:convert';
import 'perfil_page.dart';
import 'mapa_page.dart';
import 'data_service.dart';
import 'kml_data_service.dart';
import 'endereco_model.dart';
import 'pevs_associacoes_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  List<Endereco> _enderecos = [];
  int _enderecoSelecionadoIndex = 0;
  bool _carregando = true;
  bool _dadosKmlCarregados = false;
  Map<String, dynamic>? _infoColetaDomiciliar;
  Map<String, dynamic>? _infoColetaSeletiva;
  Map<String, dynamic>? _infoPevMaisProximo;
  Map<String, dynamic>? _infoAssociacaoMaisProxima;
  bool _carregandoDomiciliar = false;
  bool _carregandoSeletiva = false;
  double _progressoCardDomiciliar = 0.0;
  double _progressoCardSeletiva = 0.0;
  List<PontoEntregaVoluntaria> _todosPevs = [];
  List<AssociacaoCatadores> _todasAssociacoes = [];
  late TabController _tabController;
  final ScrollController _scrollController = ScrollController();
  bool _isHeaderExpanded = true;
  double _headerHeight = 200.0;
  double _progressoCarregamento = 0.0;
  bool _mostrarProgresso = true;

  final Color _corPrimaria = const Color(0xFF2E7D32);
  final Color _corSecundaria = const Color(0xFF388E3C);
  final Color _corDestaque = const Color(0xFF4CAF50);
  final Color _corTexto = const Color(0xFF333333);
  final Color _corFundo = const Color(0xFFFFFFFF);
  final Color _corVerdeEscuro = const Color(0xFF1B5E20);
  final Color _corCinzaClaro = const Color(0xFFF5F5F5);
  final Color _corBranco = const Color(0xFFFFFFFF);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _scrollController.addListener(_handleScroll);
    _inicializarDados();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  void _handleScroll() {
    // Controla scroll
  }

  void _toggleHeader() {
    // Alterna header
  }

  Future<void> _inicializarDados() async {
    // Inicializa dados
  }

  Future<void> _carregarDadosIncremental() async {
    // Carrega dados incremental
  }

  Future<void> _carregarDadosKmlIncremental() async {
    // Carrega KML incremental
  }

  Future<void> _processarInformacoesColetaIncremental() async {
    // Processa informações de coleta
  }

  Future<void> _carregarEnderecos() async {
    // Carrega endereços
  }

  void _refreshData() {
    // Refresh dados
  }

  void _refreshCards() {
    // Refresh cards
  }

  String _calcularProximaColeta(List<String> dias) {
    // Calcula próxima coleta
    return '';
  }

  void _navegarParaMapa() {
    // Navega para mapa
  }

  void _navegarParaPerfil() {
    // Navega para perfil
  }

  void _navegarParaMapaSeletiva() {
    // Navega para mapa seletiva
  }

  void _navegarParaMapaDomiciliar() {
    // Navega para mapa domiciliar
  }

  void _navegarParaPevsAssociacoesPage() {
    // Navega para PEVs
  }

  void _navegarParaAssociacoesPage() {
    // Navega para associações
  }

  void _navegarParaDicasReciclagem() {
    // Mostra dicas
  }

  Widget _buildHeader() {
    // Header da página
    return AnimatedContainer(
      height: _headerHeight,
      child: _isHeaderExpanded
          ? _buildExpandedHeader()
          : _buildCollapsedHeader(),
    );
  }

  Widget _buildExpandedHeader() {
    return Column(
      children: [
        Image.asset('assets/images/pga.png', height: 120),
        const Text('Soluções Integradas em Gestão de Resíduos'),
      ],
    );
  }

  Widget _buildCollapsedHeader() {
    return Row(
      children: [
        Image.asset('assets/images/pga.png', height: 45),
        const Text('Soluções em Resíduos'),
      ],
    );
  }

  Widget _buildLoadingOverlay() {
    // Overlay de carregamento
    return Container(
      color: Colors.black54,
      child: const Center(child: CircularProgressIndicator()),
    );
  }

  Widget _buildSelecionadorEndereco() {
    // Seletor de endereço
    return Container(
      margin: const EdgeInsets.all(16),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              DropdownButtonFormField<int>(
                value: _enderecoSelecionadoIndex,
                items: _enderecos.map((endereco) {
                  return DropdownMenuItem<int>(
                    value: _enderecos.indexOf(endereco),
                    child: Text(endereco.enderecoCompleto),
                  );
                }).toList(),
                onChanged: (value) {
                  // Altera endereço
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCustomTabBar() {
    // Barra de abas
    return TabBar(
      controller: _tabController,
      tabs: const [
        Tab(icon: Icon(Icons.delete_outline), text: 'Domiciliar'),
        Tab(icon: Icon(Icons.recycling), text: 'Seletiva'),
      ],
    );
  }

  Widget _buildCardColetaDomiciliar() {
    // Card coleta domiciliar
    return SingleChildScrollView(
      child: Column(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const Text('Coleta Domiciliar'),
                  // Informações da coleta
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCardColetaSeletiva() {
    // Card coleta seletiva
    return SingleChildScrollView(
      child: Column(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const Text('Coleta Seletiva'),
                  // Informações da coleta
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServicosSection() {
    // Seção de serviços
    return Column(
      children: [
        const Text('NOSSOS SERVIÇOS'),
        // Cards de serviços
      ],
    );
  }

  Widget _buildInfoSection() {
    // Seção de informações
    return Column(
      children: [
        const Text('Informações Importantes'),
        // Cards de informação
      ],
    );
  }

  Widget _buildFooter() {
    // Rodapé
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Image.asset('assets/images/pga.png', height: 100),
          const Text('Ponta Grossa Ambiental © 2025'),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PG Ambiental'),
        actions: [
          IconButton(icon: const Icon(Icons.refresh), onPressed: _refreshData),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: _navegarParaPerfil,
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              _buildHeader(),
              Expanded(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    children: [
                      _buildSelecionadorEndereco(),
                      _buildCustomTabBar(),
                      SizedBox(
                        height: 400,
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            _buildCardColetaDomiciliar(),
                            _buildCardColetaSeletiva(),
                          ],
                        ),
                      ),
                      _buildServicosSection(),
                      _buildInfoSection(),
                      _buildFooter(),
                    ],
                  ),
                ),
              ),
            ],
          ),
          if (_mostrarProgresso) _buildLoadingOverlay(),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _navegarParaMapa,
        icon: const Icon(Icons.map),
        label: const Text('Ver Mapa'),
      ),
    );
  }
}
