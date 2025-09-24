 import 'package:visa_arapiraca_app/domain/entities/notificacao.dart';

class NotificacaoModel{
  final String? id;
  final String cnpj;
  final String razaoSocial;

  final DateTime dataEmissao;
  final String exigencias;
  final String fundamentoLegal;
  final String prazo;
  final String? observacoes;

  final String fiscalResponsavel;
  final String matriculaFiscal;

  final String numeroDocumento;
  final String? status;
  final DateTime? dataCumprimento;


  NotificacaoModel({
    this.id,
    required this.cnpj,
    required this.razaoSocial,

    required this.dataEmissao,
    required this.exigencias,
    required this.fundamentoLegal,
    required this.prazo,
    this.observacoes,

    required this.fiscalResponsavel,
    required this.matriculaFiscal,
        
    required this.numeroDocumento,
    this.status,
    this.dataCumprimento
  });

  factory NotificacaoModel.fromJson(Map<String, dynamic> json){
    return NotificacaoModel(
      id: json['id'] ?? "",
      cnpj: json['cnpj'], 
      razaoSocial: json['razaoSocial'], 

      dataEmissao: json['dataEmissao'], 
      exigencias: json['exigencias'], 
      fundamentoLegal: json['fundamentoLegal'], 
      prazo: json['prazo'], 
      observacoes: json['observacoes'],

      fiscalResponsavel: json['fiscalResponsavel'],
      matriculaFiscal: json['matriculaFiscal'], 
      numeroDocumento: json['numeroDocumento'],

      status: json['status'],
      dataCumprimento: json['dataCumprimento']
    );
  }
  
  Notificacao toEntity(){
    return Notificacao(
      id: id,
      cnpj: cnpj,
      razaoSocial: razaoSocial, 
      dataEmissao: dataEmissao, 
      exigencias: exigencias, 
      fundamentoLegal: fundamentoLegal, 
      prazo: prazo, 
      observacoes: observacoes,
      fiscalResponsavel: fiscalResponsavel, 
      matriculaFiscal: matriculaFiscal, 
      numeroDocumento: numeroDocumento,
      status: status,
      dataCumprimento: dataCumprimento,
    );
  }

  factory NotificacaoModel.fromEntity(Notificacao entity){
    return NotificacaoModel(
      id: entity.id,
      cnpj: entity.cnpj, 
      razaoSocial: entity.razaoSocial, 
      dataEmissao: entity.dataEmissao, 
      exigencias: entity.exigencias, 
      fundamentoLegal: entity.fundamentoLegal, 
      prazo: entity.prazo, 
      fiscalResponsavel: entity.fiscalResponsavel, 
      matriculaFiscal: entity.matriculaFiscal, 
      numeroDocumento: entity.numeroDocumento,
      status: entity.status,
      dataCumprimento: entity.dataCumprimento
    );
  }
}