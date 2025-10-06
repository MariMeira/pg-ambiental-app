import 'package:flutter/material.dart';
import 'data_service.dart';
import 'mapa_page.dart';

class PevsAssociacoesPage extends StatefulWidget {
  final int? abaInicial;

  const PevsAssociacoesPage({super.key, this.abaInicial = 0});

  @override
  State<PevsAssociacoesPage> createState() => _PevsAssociacoesPageState();
}

class _PevsAssociacoesPageState extends State<PevsAssociacoesPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ScrollController _scrollController = ScrollController();
  bool _isHeaderExpanded = true;
  double _headerHeight = 200.0;

  final Color _corPrimaria = const Color(0xFF2E7D32);
  final Color _corSecundaria = const Color(0xFF388E3C);
  final Color _corDestaque = const Color(0xFF4CAF50);
  final Color _corTexto = const Color(0xFF333333);
  final Color _corFundo = const Color(0xFFFFFFFF);
  final Color _corVerdeEscuro = const Color(0xFF1B5E20);
  final Color _corBranco = const Color(0xFFFFFFFF);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: widget.abaInicial ?? 0,
    );
    _scrollController.addListener(_handleScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  void _handleScroll() {
    // Controla scroll do header
  }

  void _toggleHeader() {
    // Alterna header
  }

  Widget _buildHeader() {
    // Constrói header
    return AnimatedContainer(
      height: _headerHeight,
      child: _isHeaderExpanded
          ? _buildExpandedHeader()
          : _buildCollapsedHeader(),
    );
  }

  Widget _buildExpandedHeader() {
    // Header expandido
    return Column(
      children: [
        Image.asset('assets/images/pga.png', height: 120),
        const Text('Pontos de Entrega e Associações'),
      ],
    );
  }

  Widget _buildCollapsedHeader() {
    // Header recolhido
    return Row(
      children: [
        Image.asset('assets/images/pga.png', height: 45),
        const Text('Pontos de Entrega'),
      ],
    );
  }

  Widget _buildCustomTabBar() {
    // Barra de abas
    return TabBar(
      controller: _tabController,
      tabs: const [
        Tab(icon: Icon(Icons.recycling), text: 'PEVs'),
        Tab(icon: Icon(Icons.factory), text: 'Associações'),
      ],
    );
  }

  Widget _buildPontoCard({
    required IconData icone,
    required String titulo,
    required String endereco,
    required String bairro,
    required String horario,
    required String telefone,
    required String residuos,
    required Color cor,
    required VoidCallback onTap,
  }) {
    // Card de ponto
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: ListTile(
          leading: Icon(icone, color: cor),
          title: Text(titulo),
          subtitle: Text('$endereco - $bairro'),
        ),
      ),
    );
  }

  Widget _buildListaPEVs() {
    // Lista de PEVs
    final dataService = DataService();
    final pevs = dataService.pevs;

    if (pevs.isEmpty) {
      return const Center(child: Text('Nenhum PEV cadastrado'));
    }

    return ListView.builder(
      itemCount: pevs.length,
      itemBuilder: (context, index) {
        final pev = pevs[index];
        return _buildPontoCard(
          icone: Icons.recycling,
          titulo: pev.nome,
          endereco: pev.endereco,
          bairro: pev.bairro,
          horario: pev.horarioFuncionamentoDisplay,
          telefone: pev.telefone,
          residuos: pev.residuos,
          cor: _corSecundaria,
          onTap: () => _navegarParaMapaComPev(context, pev),
        );
      },
    );
  }

  Widget _buildListaAssociacoes() {
    // Lista de associações
    final dataService = DataService();
    final associacoes = dataService.associacoes;

    if (associacoes.isEmpty) {
      return const Center(child: Text('Nenhuma associação cadastrada'));
    }

    return ListView.builder(
      itemCount: associacoes.length,
      itemBuilder: (context, index) {
        final associacao = associacoes[index];
        return _buildPontoCard(
          icone: Icons.factory,
          titulo: associacao.nome,
          endereco: associacao.endereco,
          bairro: associacao.bairro,
          horario: associacao.horarioFuncionamentoDisplay,
          telefone: associacao.telefone,
          residuos: associacao.residuos,
          cor: _corDestaque,
          onTap: () => _navegarParaMapaComAssociacao(context, associacao),
        );
      },
    );
  }

  void _navegarParaMapaComPev(
    BuildContext context,
    PontoEntregaVoluntaria pev,
  ) {
    // Navega para mapa com PEV
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MapaPage(
          endereco: pev.endereco,
          mostrarPEVs: true,
          marcadorEspecial: pev.localizacao,
          tituloMarcador: pev.nome,
        ),
      ),
    );
  }

  void _navegarParaMapaComAssociacao(
    BuildContext context,
    AssociacaoCatadores associacao,
  ) {
    // Navega para mapa com associação
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MapaPage(
          endereco: associacao.endereco,
          mostrarAssociacoes: true,
          marcadorEspecial: associacao.localizacao,
          tituloMarcador: associacao.nome,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pontos de Entrega')),
      body: Column(
        children: [
          _buildHeader(),
          _buildCustomTabBar(),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [_buildListaPEVs(), _buildListaAssociacoes()],
            ),
          ),
        ],
      ),
    );
  }
}
