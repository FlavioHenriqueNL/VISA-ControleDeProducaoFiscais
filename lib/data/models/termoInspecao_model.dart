import 'package:visa_arapiraca_app/domain/entities/termoInspecao.dart';

class TermoInspecaoModel {
  final String? id;
  final String numeroDocumento;
  final String cnpj;
  final String razaoSocial;
  final String numeroProcesso;
  final String cnaePrincipal;
  final List<String>? cnaesSecundarios;
  final DateTime dataCompleta;
  final String objetoInspecao;
  final String fatoInspecao;
  final String fundamentosLegais;
  final String matriculaFiscal; // Identificador do fiscal responsável
  final String fiscalResponsavel;


  TermoInspecaoModel({
    this.id,
    required this.numeroDocumento,
    required this.cnpj,
    required this.razaoSocial,
    required this.numeroProcesso,
    required this.cnaePrincipal,
    this.cnaesSecundarios,
    required this.dataCompleta,
    required this.objetoInspecao,
    required this.fatoInspecao,
    required this.fundamentosLegais,
    required this.fiscalResponsavel,
    required this.matriculaFiscal,
  });

  factory TermoInspecaoModel.fromJson(Map<String, dynamic> json){
    return TermoInspecaoModel(
      id: json['id'], 
      numeroDocumento: json['numeroDocumento'],
      cnpj: json['cnpj'], 
      razaoSocial: json['razaoSocial'], 
      numeroProcesso: json['numeroProcesso'], 
      cnaePrincipal: json['cnaePrincipal'], 
      dataCompleta: json['dataCompleta'], 
      objetoInspecao: json['objetoInspecao'], 
      fatoInspecao: json['fatoInspecao'], 
      fundamentosLegais: json['fundamentosLegais'], 
      fiscalResponsavel: json['fiscalResponsavel'], 
      matriculaFiscal: json['matriculaFiscal'] 
    );
  }
  TermoInspecao toEntity(){
    return TermoInspecao(
      id: id ?? "", 
      numeroDocumento: numeroDocumento,
      cnpj: cnpj, 
      razaoSocial: razaoSocial, 
      numeroProcesso: numeroProcesso, 
      cnaePrincipal: cnaePrincipal, 
      dataCompleta: dataCompleta, 
      objetoInspecao: objetoInspecao, 
      fatoInspecao: fatoInspecao, 
      fundamentosLegais: fundamentosLegais, 
      fiscalResponsavel: fiscalResponsavel, 
      matriculaFiscal: matriculaFiscal
    );
  }

  factory TermoInspecaoModel.fromEntity(TermoInspecao entity){
    return TermoInspecaoModel(
      id: entity.id,
      numeroDocumento: entity.numeroDocumento,
      cnpj: entity.cnpj, 
      razaoSocial: entity.razaoSocial, 
      numeroProcesso: entity.numeroProcesso, 
      cnaePrincipal: entity.cnaePrincipal, 
      dataCompleta: entity.dataCompleta, 
      objetoInspecao: entity.objetoInspecao, 
      fatoInspecao: entity.fatoInspecao, 
      fundamentosLegais: entity.fundamentosLegais, 
      fiscalResponsavel: entity.fiscalResponsavel, 
      matriculaFiscal: entity.matriculaFiscal
    );
  }

}