import 'package:flutter/material.dart';
import 'mapa_controller.dart';
import 'data_service.dart';
import 'legenda_panel.dart';

class FiltrosPanel {
  static Widget buildPanelLateral(
    BuildContext context,
    MapaController controller,
    VoidCallback onStateUpdate,
  ) {
    return AnimatedPositioned(
      duration: controller.duracaoAnimacaoPadrao,
      curve: controller.curvaAnimacaoPadrao,
      top: 60,
      left: controller.panelAberto ? 10 : -300,
      child: AnimatedContainer(
        duration: controller.duracaoAnimacaoPadrao,
        curve: controller.curvaAnimacaoPadrao,
        width: 300,
        height: MediaQuery.of(context).size.height - 120,
        decoration: BoxDecoration(...),
        child: Material(
          color: Colors.transparent,
          child: StatefulBuilder(
            builder: (context, setStateLocal) {
              return Column(
                children: [
                  _buildCabecalho(controller, onStateUpdate),
                  _buildAbasNavegacao(controller, setStateLocal, onStateUpdate),
                  _buildIndicadorAba(controller),
                  _buildConteudoAbas(controller, setStateLocal, onStateUpdate, context),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  static Widget _buildCabecalho(MapaController controller, VoidCallback onStateUpdate) {...}
  static void _fecharPopupEAbrirPainel(MapaController controller, VoidCallback onStateUpdate) {...}
  static Widget _buildAbasNavegacao(MapaController controller, StateSetter setStateLocal, VoidCallback onStateUpdate) {...}
  static Widget _buildAbaFiltros(MapaController controller, StateSetter setStateLocal, VoidCallback onStateUpdate) {...}
  static Widget _buildAbaLegenda(MapaController controller, StateSetter setStateLocal, VoidCallback onStateUpdate) {...}
  static Widget _buildIndicadorAba(MapaController controller) {...}
  static Widget _buildConteudoAbas(MapaController controller, StateSetter setStateLocal, VoidCallback onStateUpdate, BuildContext context) {...}
  static Widget _buildAbaFiltrosConteudo(MapaController controller, StateSetter setStateLocal, VoidCallback onStateUpdate) {...}
  static Widget _buildFiltrosDomiciliar(MapaController controller, StateSetter setStateLocal, VoidCallback onStateUpdate) {...}
  static Widget _buildCategoriaFiltro(MapaController controller, String categoria, StateSetter setStateLocal, VoidCallback onStateUpdate) {...}
  static Widget _buildSetorFiltro(MapaController controller, Setor setor, String categoria, StateSetter setStateLocal, VoidCallback onStateUpdate) {...}
  static Widget _buildFiltrosSeletiva(MapaController controller, StateSetter setStateLocal, VoidCallback onStateUpdate) {...}
  static Widget _buildFiltroPevs(MapaController controller, bool todosSelecionados, StateSetter setStateLocal, VoidCallback onStateUpdate) {...}
  static Widget _buildItemPevFiltro(MapaController controller, PontoEntregaVoluntaria pev, StateSetter setStateLocal, VoidCallback onStateUpdate) {...}
  static Widget _buildFiltroAssociacoes(MapaController controller, bool todasSelecionadas, StateSetter setStateLocal, VoidCallback onStateUpdate) {...}
  static Widget _buildItemAssociacaoFiltro(MapaController controller, AssociacaoCatadores associacao, StateSetter setStateLocal, VoidCallback onStateUpdate) {...}
  static Widget _buildFiltroSetoresDiurnos(MapaController controller, bool todosSelecionados, StateSetter setStateLocal, VoidCallback onStateUpdate) {...}
  static Widget _buildFiltroSetoresNoturnos(MapaController controller, bool todosSelecionados, StateSetter setStateLocal, VoidCallback onStateUpdate) {...}
  static Widget _buildItemSetorFiltro(MapaController controller, SetorColetaSeletiva setor, bool isDiurno, StateSetter setStateLocal, VoidCallback onStateUpdate) {...}
  static Widget _buildLoadingIndicator(MapaController controller) {...}
  static void _resetDetalhes(MapaController controller) {...}
}