class Estabelecimento{

  final String? numeroAlvara;
  final String cpfCnpj;
  final String razaoSocial;
  final String nomeFantasia;
  final String telefone;
  final String email;
  final String cnae;
  final String cep;
  final String numeroResidencia;
  final String complemento;
  final String responsavel;
  final String cpfResponsavel;
  final String? codigoConselho;

  Estabelecimento({

    this.numeroAlvara,
    required this.cpfCnpj,
    required this.razaoSocial,
    required this.nomeFantasia,
    required this.telefone,
    required this.email,
    required this.cnae,
    required this.cep,
    required this.numeroResidencia,
    required this.complemento,
    required this.responsavel,
    required this.cpfResponsavel,
    this.codigoConselho,
  });
}