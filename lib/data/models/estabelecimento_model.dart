  import 'package:visa_arapiraca_app/domain/entities/estabelecimento.dart';

class EstabelecimentoModel{

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

    EstabelecimentoModel({

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

    factory EstabelecimentoModel.fromJson(Map<String, dynamic> json){
        return EstabelecimentoModel(
            numeroAlvara: json['numeroAlvara'],
            cpfCnpj: json['cpfCnpj'], 
            razaoSocial: json['razaoSocial'], 
            nomeFantasia: json['nomeFantasia'], 
            telefone: json['telefone'], 
            email: json['email'],
            cnae: json['cnae'], 
            cnaesSecundarios: json['cnaesSecundarios'], 
            cep: json['cep'], 
            numeroResidencia: json['numeroResidencia'], 
            complemento: json['complemento'], 
            responsavel: json['responsavel'], 
            cpfResponsavel: json['cpfResponsavel'],
            codigoConselho: json['codigoConselho']
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
        'cnaesSecundarios': cnaesSecundarios,
        'cep': cep,
        'numeroResidencia': numeroResidencia,
        'complemento': complemento,
        'responsavel': responsavel,
        'cpfResponsavel': cpfResponsavel,
        'codigoConselho': codigoConselho
    };

    Estabelecimento toEntity() => Estabelecimento(
      numeroAlvara: numeroAlvara,
      cpfCnpj: cpfCnpj,
      razaoSocial: razaoSocial,
      nomeFantasia: nomeFantasia,
      telefone: telefone,
      email: email,
      cnae: cnae,
      cnaesSecundarios: cnaesSecundarios,
      cep: cep,
      numeroResidencia: numeroResidencia,
      complemento: complemento,
      responsavel: responsavel,
      cpfResponsavel: cpfResponsavel,
      codigoConselho: codigoConselho,
    );

    factory EstabelecimentoModel.fromEntity(Estabelecimento e) => EstabelecimentoModel(
      numeroAlvara: e.numeroAlvara,
      cpfCnpj: e.cpfCnpj,
      razaoSocial: e.razaoSocial,
      nomeFantasia: e.nomeFantasia,
      telefone: e.telefone,
      email: e.email,
      cnae: e.cnae,
      cnaesSecundarios: e.cnaesSecundarios,
      cep: e.cep,
      numeroResidencia: e.numeroResidencia,
      complemento: e.complemento,
      responsavel: e.responsavel,
      cpfResponsavel: e.cpfResponsavel,
      codigoConselho: e.codigoConselho,
    );
}
