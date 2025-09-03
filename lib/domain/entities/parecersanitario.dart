class ParecerSanitario {
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

  ParecerSanitario({
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
}