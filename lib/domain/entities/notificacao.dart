 class Notificacao{
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


  Notificacao({
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

}