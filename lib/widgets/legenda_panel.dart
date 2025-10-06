import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'mapa_controller.dart';
import 'data_service.dart';

class LegendaPanel {
  static Widget buildLegendaCorreta(
    MapaController controller,
    StateSetter setStateLocal,
    VoidCallback onStateUpdate,
    BuildContext context,
  ) {...}

  static Widget _buildConteudoLegenda(
    MapaController controller,
    StateSetter setStateLocal,
    VoidCallback onStateUpdate,
    BuildContext context,
  ) {...}

  static Widget _buildConteudoScrollavel(
    MapaController controller,
    StateSetter setStateLocal,
    VoidCallback onStateUpdate,
    BuildContext context,
  ) {...}

  static Widget _buildListaLegenda(
    MapaController controller,
    StateSetter setStateLocal,
    VoidCallback onStateUpdate,
    BuildContext context,
  ) {...}

  static Widget _buildListaLegendaDomiciliarComState(
    MapaController controller,
    StateSetter setStateLocal,
    VoidCallback onStateUpdate,
    BuildContext context,
  ) {...}

  static Widget _buildDetalhesSetorDomiciliarComState(
    MapaController controller,
    Setor setor,
    StateSetter setStateLocal,
    VoidCallback onStateUpdate,
  ) {...}

  static Widget _buildListaLegendaSeletivaComState(
    MapaController controller,
    StateSetter setStateLocal,
    VoidCallback onStateUpdate,
    BuildContext context,
  ) {...}

  static Widget _buildSecaoPevs(
    MapaController controller,
    StateSetter setStateLocal,
    VoidCallback onStateUpdate,
  ) {...}

  static Widget _buildItemLegendaPev(
    MapaController controller,
    PontoEntregaVoluntaria pev,
    StateSetter setStateLocal,
    VoidCallback onStateUpdate,
  ) {...}

  static Widget _buildSecaoAssociacoes(
    MapaController controller,
    StateSetter setStateLocal,
    VoidCallback onStateUpdate,
  ) {...}

  static Widget _buildItemLegendaAssociacao(
    MapaController controller,
    AssociacaoCatadores associacao,
    StateSetter setStateLocal,
    VoidCallback onStateUpdate,
  ) {...}

  static Widget _buildSecaoSetoresDiurnos(
    MapaController controller,
    List<SetorColetaSeletiva> setoresDiurnos,
    StateSetter setStateLocal,
    VoidCallback onStateUpdate,
  ) {...}

  static Widget _buildSecaoSetoresNoturnos(
    MapaController controller,
    List<SetorColetaSeletiva> setoresNoturnos,
    StateSetter setStateLocal,
    VoidCallback onStateUpdate,
  ) {...}

  static Widget _buildItemLegendaSetor(
    MapaController controller,
    SetorColetaSeletiva setor,
    StateSetter setStateLocal,
    VoidCallback onStateUpdate,
  ) {...}

  static Widget _buildDetalhesSetorSeletivaComState(
    MapaController controller,
    SetorColetaSeletiva setor,
    StateSetter setStateLocal,
    VoidCallback onStateUpdate,
  ) {...}

  static Widget _buildDetalhesPevComState(
    MapaController controller,
    PontoEntregaVoluntaria pev,
    StateSetter setStateLocal,
    VoidCallback onStateUpdate,
  ) {...}

  static Widget _buildDetalhesAssociacaoComState(
    MapaController controller,
    AssociacaoCatadores associacao,
    StateSetter setStateLocal,
    VoidCallback onStateUpdate,
  ) {...}

  static Widget _buildCabecalhoDetalhes(
    MapaController controller,
    String titulo,
    StateSetter setStateLocal,
    VoidCallback onStateUpdate,
    VoidCallback onVoltar, {
    Color? cor,
  }) {...}

  static Widget _buildCabecalhoItem(
    MapaController controller,
    String titulo,
    String? subtitulo,
    Color cor,
    IconData icone, {
    double avaliacao = 0,
  }) {...}

  static Widget _buildInfoItemDetalhes(
      String label, String value, MapaController controller) {...}

  static Widget _buildGoogleMapsCardDetalhes(
      String endereco, String bairro, MapaController controller) {...}

  static Widget _buildBotaoAcao(
    MapaController controller,
    String texto,
    IconData icone,
    Color cor,
    VoidCallback onTap,
  ) {...}

  static Widget _buildAvaliacaoStars(double avaliacao) {...}

  static Widget _buildLoadingIndicator(MapaController controller) {...}
}