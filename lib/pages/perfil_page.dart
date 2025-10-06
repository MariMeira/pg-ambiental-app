import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'endereco_model.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({super.key});

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  final TextEditingController _cepController = TextEditingController();
  final TextEditingController _logradouroController = TextEditingController();
  final TextEditingController _bairroController = TextEditingController();
  final TextEditingController _numeroController = TextEditingController();
  final TextEditingController _cidadeController = TextEditingController();
  final TextEditingController _estadoController = TextEditingController();
  final TextEditingController _complementoController = TextEditingController();

  List<Endereco> _enderecos = [];
  bool _buscandoCep = false;
  bool _cepValidado = false;
  bool _mostrarFormulario = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int? _indiceEdicao;

  final Color _corPrimaria = const Color(0xFF2E7D32);
  final Color _corTexto = const Color(0xFF333333);
  final Color _corFundo = const Color(0xFFFFFFFF);
  final Color _corVerdeEscuro = const Color(0xFF1B5E20);
  final Color _corCinzaClaro = const Color(0xFFF5F5F5);
  final Color _corBranco = const Color(0xFFFFFFFF);

  @override
  void initState() {
    super.initState();
    _carregarEnderecos();
  }

  @override
  void dispose() {
    _cepController.dispose();
    _logradouroController.dispose();
    _bairroController.dispose();
    _numeroController.dispose();
    _cidadeController.dispose();
    _estadoController.dispose();
    _complementoController.dispose();
    super.dispose();
  }

  Future<void> _carregarEnderecos() async {
    // Carrega endereços salvos
  }

  Future<void> _salvarEnderecos() async {
    // Salva endereços
  }

  Future<void> _fetchAddressFromCep(String cep) async {
    // Busca endereço via CEP
  }

  void _salvarEndereco() {
    // Salva endereço
  }

  void _limparFormulario() {
    // Limpa formulário
  }

  void _removerEndereco(int index) {
    // Remove endereço
  }

  void _editarEndereco(int index) {
    // Edita endereço
  }

  void _toggleFormulario() {
    // Alterna formulário
  }

  Widget _buildCustomButton(
    String text,
    VoidCallback onPressed, {
    bool isPrimary = true,
  }) {
    // Constrói botão customizado
    return ElevatedButton(onPressed: onPressed, child: Text(text));
  }

  Widget _buildCustomCard(Widget child) {
    // Constrói card customizado
    return Card(child: child);
  }

  Widget _buildCustomTextField({
    required TextEditingController controller,
    required String labelText,
    bool readOnly = false,
    bool isRequired = false,
    TextInputType keyboardType = TextInputType.text,
    List<TextInputFormatter>? inputFormatters,
    String? Function(String?)? validator,
    VoidCallback? onTap,
  }) {
    // Constrói campo de texto
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(labelText: labelText),
      validator: validator,
    );
  }

  Widget _buildEnderecoCard(Endereco endereco, int index) {
    // Constrói card de endereço
    return _buildCustomCard(
      Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(endereco.logradouro),
            Text('${endereco.numero} - ${endereco.bairro}'),
            // Mais informações do endereço
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Meus Endereços')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            if (!_mostrarFormulario)
              _buildCustomButton('Adicionar Novo Endereço', _toggleFormulario),

            if (_mostrarFormulario)
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        // Campos do formulário
                        _buildCustomTextField(
                          controller: _cepController,
                          labelText: 'CEP',
                        ),
                        _buildCustomTextField(
                          controller: _logradouroController,
                          labelText: 'Logradouro',
                        ),
                        // Mais campos...
                      ],
                    ),
                  ),
                ),
              ),

            if (!_mostrarFormulario)
              Expanded(
                child: _enderecos.isEmpty
                    ? const Center(child: Text('Nenhum endereço cadastrado'))
                    : ListView.builder(
                        itemCount: _enderecos.length,
                        itemBuilder: (context, index) {
                          return _buildEnderecoCard(_enderecos[index], index);
                        },
                      ),
              ),
          ],
        ),
      ),
    );
  }
}
