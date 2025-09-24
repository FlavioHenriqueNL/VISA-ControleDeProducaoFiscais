class TermoInspecao {
  final String? id;
  final String numeroDocumento;
  final String numeroProcesso;
  final String cnpj;
  final String razaoSocial;
  final String cnaePrincipal;
  final List<String>? cnaesSecundarios;
  final DateTime dataCompleta;
  final String objetoInspecao;
  final String fatoInspecao;
  final String fundamentosLegais;
  final String matriculaFiscal; // Identificador do fiscal responsável
  final String fiscalResponsavel;

  TermoInspecao({
    this.id,
    required this.numeroDocumento,
    required this.numeroProcesso,
    required this.cnpj,
    required this.razaoSocial,
    required this.cnaePrincipal,
    this.cnaesSecundarios,
    required this.dataCompleta,
    required this.objetoInspecao,
    required this.fatoInspecao,
    required this.fundamentosLegais,
    required this.fiscalResponsavel,
    required this.matriculaFiscal,
  });
}