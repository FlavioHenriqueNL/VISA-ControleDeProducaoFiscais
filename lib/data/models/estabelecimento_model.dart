  import 'dart:convert';

import 'package:visa_arapiraca_app/domain/entities/estabelecimento.dart';

class EstabelecimentoModel{

  final String cpfCnpj;
  final String razaoSocial;
  final String? nomeFantasia;
  final String cnae;
  final List<String>? cnaesSecundarios;
  final String cep;
  final String numeroResidencia;
  final String? complemento;
  final String? telefone;
  final String? email;
  final String? responsavel;
  final String? cpfResponsavel;
  final String? codigoConselho;
  final String? numeroAlvara;
  final DateTime? vencimentoAlvara;

  EstabelecimentoModel({

    required this.cpfCnpj,
    required this.razaoSocial,
    this.nomeFantasia,
    required this.cnae,
    this.cnaesSecundarios,
    required this.cep,
    required this.numeroResidencia,
    this.complemento,
    required this.telefone,
    required this.email,
    this.responsavel,
    this.cpfResponsavel,
    this.codigoConselho,
    this.numeroAlvara,
    this.vencimentoAlvara

  });

   // --- CopyWith ---
  EstabelecimentoModel copyWith({
    String? cpfCnpj,
    String? razaoSocial,
    String? nomeFantasia,
    String? cnae,
    List<String>? cnaesSecundarios,
    String? cep,
    String? numeroResidencia,
    String? complemento,
    String? telefone,
    String? email,
    String? responsavel,
    String? cpfResponsavel,
    String? codigoConselho,
    String? numeroAlvara,
    DateTime? vencimentoAlvara,
  }) {
    return EstabelecimentoModel(
      cpfCnpj: cpfCnpj ?? this.cpfCnpj,
      razaoSocial: razaoSocial ?? this.razaoSocial,
      nomeFantasia: nomeFantasia ?? this.nomeFantasia,
      cnae: cnae ?? this.cnae,
      cnaesSecundarios: cnaesSecundarios ?? this.cnaesSecundarios,
      cep: cep ?? this.cep,
      numeroResidencia: numeroResidencia ?? this.numeroResidencia,
      complemento: complemento ?? this.complemento,
      telefone: telefone ?? this.telefone,
      email: email ?? this.email,
      responsavel: responsavel ?? this.responsavel,
      cpfResponsavel: cpfResponsavel ?? this.cpfResponsavel,
      codigoConselho: codigoConselho ?? this.codigoConselho,
      numeroAlvara: numeroAlvara ?? this.numeroAlvara,
      vencimentoAlvara: vencimentoAlvara ?? this.vencimentoAlvara,
    );
  }

  // --- Conversão Model <-> Entity ---
  Estabelecimento toEntity() {
    return Estabelecimento(
      cpfCnpj: cpfCnpj,
      razaoSocial: razaoSocial,
      nomeFantasia: nomeFantasia,
      cnae: cnae,
      cnaesSecundarios: cnaesSecundarios,
      cep: cep,
      numeroResidencia: numeroResidencia,
      complemento: complemento,
      telefone: telefone,
      email: email,
      responsavel: responsavel,
      cpfResponsavel: cpfResponsavel,
      codigoConselho: codigoConselho,
      numeroAlvara: numeroAlvara,
      vencimentoAlvara: vencimentoAlvara,
    );
  }

  factory EstabelecimentoModel.fromEntity(Estabelecimento entity) {
    return EstabelecimentoModel(
      cpfCnpj: entity.cpfCnpj,
      razaoSocial: entity.razaoSocial,
      nomeFantasia: entity.nomeFantasia,
      cnae: entity.cnae,
      cnaesSecundarios: entity.cnaesSecundarios,
      cep: entity.cep,
      numeroResidencia: entity.numeroResidencia,
      complemento: entity.complemento,
      telefone: entity.telefone,
      email: entity.email,
      responsavel: entity.responsavel,
      cpfResponsavel: entity.cpfResponsavel,
      codigoConselho: entity.codigoConselho,
      numeroAlvara: entity.numeroAlvara,
      vencimentoAlvara: entity.vencimentoAlvara,
    );
  }

  // --- Conversão Model <-> Map / JSON ---
  Map<String, dynamic> toJson() {
    return {
      'cpfCnpj': cpfCnpj,
      'razaoSocial': razaoSocial,
      'nomeFantasia': nomeFantasia,
      'cnae': cnae,
      'cnaesSecundarios': cnaesSecundarios,
      'cep': cep,
      'numeroResidencia': numeroResidencia,
      'complemento': complemento,
      'telefone': telefone,
      'email': email,
      'responsavel': responsavel,
      'cpfResponsavel': cpfResponsavel,
      'codigoConselho': codigoConselho,
      'numeroAlvara': numeroAlvara,
      'vencimentoAlvara': vencimentoAlvara?.toIso8601String(),
    };
  }

  factory EstabelecimentoModel.fromJson(Map<String, dynamic> json) {
    return EstabelecimentoModel(
      cpfCnpj: json['cpfCnpj'] ?? '',
      razaoSocial: json['razaoSocial'] ?? '',
      nomeFantasia: json['nomeFantasia'],
      cnae: json['cnae'] ?? '',
      cnaesSecundarios: (json['cnaesSecundarios'] is Iterable)
      ? List<String>.from(json['cnaesSecundarios'])
      : (json['cnaesSecundarios'] != null ? [json['cnaesSecundarios'].toString()] : []),
      cep: json['cep'] ?? '',
      numeroResidencia: json['numeroResidencia'] ?? '',
      complemento: json['complemento']?? '',
      telefone: json['telefone']?? '',
      email: json['email']?? '',
      responsavel: json['responsavel']?? '',
      cpfResponsavel: json['cpfResponsavel']?? '',
      codigoConselho: json['codigoConselho']?? '',
      numeroAlvara: json['numeroAlvara']?? '',
      vencimentoAlvara: json['vencimentoAlvara'] != null
          ? DateTime.parse(json['vencimentoAlvara'])
          : null,
    );
  }

  @override
  String toString() {
    return 'EstabelecimentoModel(cpfCnpj: $cpfCnpj, razaoSocial: $razaoSocial, nomeFantasia: $nomeFantasia, cnae: $cnae, cnaesSecundarios: $cnaesSecundarios, cep: $cep, numeroResidencia: $numeroResidencia, complemento: $complemento, telefone: $telefone, email: $email, responsavel: $responsavel, cpfResponsavel: $cpfResponsavel, codigoConselho: $codigoConselho, numeroAlvara: $numeroAlvara, vencimentoAlvara: $vencimentoAlvara)';
  }


}
