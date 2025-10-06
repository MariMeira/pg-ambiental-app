import 'package:latlong2/latlong.dart';
import 'package:flutter/material.dart';

class Endereco {
  final String cep;
  final String logradouro;
  final String bairro;
  final String numero;
  final String cidade;
  final String estado;
  final String? complemento;

  Endereco({
    required this.cep,
    required this.logradouro,
    required this.bairro,
    required this.numero,
    required this.cidade,
    required this.estado,
    this.complemento,
  });

  String get enderecoCompleto {
    return '$logradouro, $numero, $bairro, $cidade - $estado, $cep${complemento != null ? ', $complemento' : ''}';
  }

  Map<String, dynamic> toJson() {
    return {
      'cep': cep,
      'logradouro': logradouro,
      'bairro': bairro,
      'numero': numero,
      'cidade': cidade,
      'estado': estado,
      'complemento': complemento,
    };
  }

  factory Endereco.fromJson(Map<String, dynamic> json) {
    return Endereco(
      cep: json['cep'],
      logradouro: json['logradouro'],
      bairro: json['bairro'],
      numero: json['numero'],
      cidade: json['cidade'],
      estado: json['estado'],
      complemento: json['complemento'],
    );
  }
}

class EnderecoComMarcador {
  final Endereco endereco;
  LatLng localizacao;
  Color corMarcador;
  final String id;

  EnderecoComMarcador({
    required this.endereco,
    required this.localizacao,
    required this.corMarcador,
    required this.id,
  });

  String get enderecoCompleto => endereco.enderecoCompleto;

  Map<String, dynamic> toJson() {
    return {
      'endereco': endereco.toJson(),
      'latitude': localizacao.latitude,
      'longitude': localizacao.longitude,
      'corMarcador': corMarcador.value,
      'id': id,
    };
  }

  factory EnderecoComMarcador.fromJson(Map<String, dynamic> json) {
    return EnderecoComMarcador(
      endereco: Endereco.fromJson(json['endereco']),
      localizacao: LatLng(json['latitude'], json['longitude']),
      corMarcador: Color(json['corMarcador']),
      id: json['id'],
    );
  }
}
