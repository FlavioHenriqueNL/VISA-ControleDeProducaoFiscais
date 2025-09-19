class Estabelecimento{

  final String? numeroAlvara;
  final String cpfCnpj;
  final String razaoSocial;
  final String? nomeFantasia;
  final String? telefone;
  final String? email;
  final String cnae;
  final List<String>? cnaesSecundarios;
  final String cep;
  final String numeroResidencia;
  final String? complemento;
  final String? responsavel;
  final String? cpfResponsavel;
  final String? codigoConselho;

  Estabelecimento({

    this.numeroAlvara,
    required this.cpfCnpj,
    required this.razaoSocial,
    this.nomeFantasia,
    required this.telefone,
    required this.email,
    required this.cnae,
    this.cnaesSecundarios,
    required this.cep,
    required this.numeroResidencia,
    this.complemento,
    this.responsavel,
    this.cpfResponsavel,
    this.codigoConselho,
  });
}