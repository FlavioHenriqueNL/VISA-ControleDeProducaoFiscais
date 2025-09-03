import 'package:visa_arapiraca_app/domain/entities/parecersanitario.dart';

class ParecerSanitarioModel {
  final String id;
  final String cnpj;
  final String razaoSocial;
  final String numeroProcesso;
  final String cnaePrincipal;
  final List<String>? cnaesSecundarios;
  final String analiseTecnica;
  final DateTime data;
  final String validade;
  final String taxa;
  final String cpfFiscal; // Identificador do fiscal responsável

  ParecerSanitarioModel({
    required this.id,
    required this.cnpj,
    required this.razaoSocial,
    required this.data,
    required this.numeroProcesso,
    required this.cnaePrincipal,
    this.cnaesSecundarios,
    required this.analiseTecnica,
    required this.validade,
    required this.taxa,
    required this.cpfFiscal,
  });

  factory ParecerSanitarioModel.fromJson(Map<String, dynamic> json) {
    return ParecerSanitarioModel(
      id: json['id'],
      cnpj: json['cnpj'],
      razaoSocial: json['razaoSocial'],
      data: DateTime.parse(json['data']),
      numeroProcesso: json['numeroProcesso'],
      cnaePrincipal: json['cnaePrincipal'],
      cnaesSecundarios: json['cnaesSecundarios'] != null ? List<String>.from(json['cnaesSecundarios']) : null,
      analiseTecnica: json['analiseTecnica'],
      validade: json['validade'],
      taxa: json['taxa'],
      cpfFiscal: json['cpfFiscal'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'cnpj': cnpj,
      'razaoSocial': razaoSocial,
      'data': data.toIso8601String(),
      'numeroProcesso': numeroProcesso,
      'cnaePrincipal': cnaePrincipal,
      'cnaesSecundarios': cnaesSecundarios,
      'analiseTecnica': analiseTecnica,
      'validade': validade,
      'taxa': taxa,
      'cpfFiscal': cpfFiscal,
    };
  }
  ParecerSanitario toEntity() {
    return ParecerSanitario(
      id: id,
      cnpj: cnpj,
      razaoSocial: razaoSocial,
      data: data,
      numeroProcesso: numeroProcesso,
      cnaePrincipal: cnaePrincipal,
      cnaesSecundarios: cnaesSecundarios,
      analiseTecnica: analiseTecnica,
      validade: validade,
      taxa: taxa,
      cpfFiscal: cpfFiscal,
    );
  }
  factory ParecerSanitarioModel.fromEntity(ParecerSanitario entity) {
    return ParecerSanitarioModel(
      id: entity.id,
      cnpj: entity.cnpj,
      razaoSocial: entity.razaoSocial,
      data: entity.data,
      numeroProcesso: entity.numeroProcesso,
      cnaePrincipal: entity.cnaePrincipal,
      cnaesSecundarios: entity.cnaesSecundarios,
      analiseTecnica: entity.analiseTecnica,
      validade: entity.validade,
      taxa: entity.taxa,
      cpfFiscal: entity.cpfFiscal,
    );
  }
}