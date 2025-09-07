    class EstabelecimentoModel{

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

    EstabelecimentoModel({

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

    factory EstabelecimentoModel.fromJson(Map<String, dynamic> json){
        return EstabelecimentoModel(
            numeroAlvara: json['numeroAlvara'],
            cpfCnpj: json['cpfCnpj'], 
            razaoSocial: json['razaoSocial'], 
            nomeFantasia: json['nomeFantasia'], 
            telefone: json['telefone'], 
            email: json['email'], 
            cnae: json['cnae'], 
            cep: json['cep'], 
            numeroResidencia: json['numeroResidencia'], 
            complemento: json['complemento'], 
            responsavel: json['responsavel'], 
            cpfResponsavel: json['cpfResponsavel']
        );
    }
    Map<String, dynamic> toJson() => {
        'numeroAlvara': numeroAlvara,
        'cpfCnpj': cpfCnpj,
        'razaoSocial': razaoSocial,
        'nomeFantasia': nomeFantasia,
        'telefone': telefone,
        'email': email,
        'cnae': cnae,
        'cep': cep,
        'numeroResidencia': numeroResidencia,
        'complemento': complemento,
        'responsavel': responsavel,
        'cpfResponsavel': cpfResponsavel,
        'codigoConselho': codigoConselho
    };
}
