class Estabelecimento{

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

  Estabelecimento({
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
}