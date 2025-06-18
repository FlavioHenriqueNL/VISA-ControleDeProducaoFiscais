class Notificacoes{
  String cnpj;
  String razaoSocial;
  String motivo;


  Notificacoes({
    required this.cnpj,
    required this.razaoSocial,
    required this.motivo
  });

  factory Notificacoes.fromJson(Map<String, dynamic> json){
    return Notificacoes(
      cnpj: json['cnpj'] ?? '', 
      razaoSocial: json['razaoSocial'] ?? '', 
      motivo: json['motivo'] ?? ''
    );
  }
  Map<String, dynamic> toJson() => {
    'cnpj': cnpj,
    'razaoSocial': razaoSocial,
    'motivo': motivo
  };
}

class Apreensoes extends Notificacoes{
  final String itensApreendidos;

  Apreensoes( {
    required super.cnpj,
    required super.razaoSocial,
    required super.motivo,
    required this.itensApreendidos
  });

  factory Apreensoes. fromJson(Map<String, dynamic> json){
    return Apreensoes( 
      cnpj: json['cnpj'] ?? '', 
      razaoSocial: json['razaoSocial'] ?? '', 
      motivo: json['motivo'] ?? '', 
      itensApreendidos: json['itensApreendidos'] ?? ''
    );
  }

  @override
  Map<String, dynamic> toJson() => {
    ...super.toJson(),
    'itensApreendidos': itensApreendidos
  };
}

class Producao{

  DateTime dataInspecao;
  int? inspecoes;
  int? denuncias;
  int? pareceres;
  List<Notificacoes> notificacoes;
  List<Notificacoes> autosInfracao;
  List<Notificacoes> interdicoes;
  List<Apreensoes> apreensoes;
  

  Producao(
    {
       required this.dataInspecao,
       this.inspecoes = 0,
       this.denuncias = 0,
       this.pareceres = 0,
       this.notificacoes = const [],
       this.autosInfracao = const [],
       this.interdicoes = const [],
       this.apreensoes = const []
    }
  );

  factory Producao.toJson(Map<String, dynamic> json){
    return Producao(
      dataInspecao: DateTime.parse(json['dataInspecao']),
      inspecoes: json['inspecoes'] ?? 0,
      denuncias: json['denuncias'] ?? 0,
      pareceres: json['pareceres'] ?? 0,
      notificacoes: (json['notificacoes']?['empresasNotificadas']??[])
        .map<Notificacoes>((e) => Notificacoes.fromJson(e)).toList(),
      autosInfracao: (json['autosInfracao']?['empresasNotificadas']??[])
        .map<Notificacoes>((e) => Notificacoes.fromJson(e)),
      interdicoes: (json['interdicoes']?['empresasNotificadas']??[])
        .map<Notificacoes>((e) => Notificacoes.fromJson(e)),
      apreensoes: (json['apreensoes']?['empresasNotificadas']??[])
        .map<Apreensoes>((e) => Apreensoes.fromJson(e))
    );  
  }

  Map<String, dynamic> toJson() => {
    'dataInspecao': dataInspecao,
    'inspecoes' : inspecoes,
    'denuncias' : denuncias,
    'pareceres' : pareceres,
    'notificacoes' : {
      'quantidade' : notificacoes.length,
      'empresasNotificadas': notificacoes.map((e) => e.toJson()).toList()
    },
    'autosInfracao' : {
      'quantidade' : autosInfracao.length,
      'empresasNotificadas': autosInfracao.map((e) => e.toJson()).toList()
    },
    'interdicoes' : {
      'quantidade' : interdicoes.length,
      'empresasNotificadas' : interdicoes.map((e) => e.toJson()).toList()
    },
    'apreensoes' : {
      'quantidade' : apreensoes.length,
      'empresasNotificadas' : apreensoes.map((e) => e.toJson()).toList()
    }
  }; 
}
