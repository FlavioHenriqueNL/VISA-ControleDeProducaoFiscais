class Cnaes {
  final String codigo;
  final String descricao;
  final String categoria;
  final String nivelRisco;
  final bool pbaObrigatorio;

  Cnaes({
    required this.codigo,
    required this.descricao,
    required this.categoria,
    required this.nivelRisco,
    required this.pbaObrigatorio,
  });

  Map<String, dynamic> toJson() => {
    'CNAE': codigo,
    'DESCRIÇÃO': descricao,
    'CATEGORIA': categoria,
    'NÍVEL RISCO': nivelRisco,
    'PBA Obrigatório': pbaObrigatorio ? "SIM" : "NÃO",
  };

  factory Cnaes.fromJson(Map<String, dynamic> json) {
    return Cnaes(
      codigo: json['CNAE'] ?? '',
      descricao: json['DESCRIÇÃO'] ?? '',
      categoria: json['CATEGORIA'] ?? '',
      nivelRisco: json['NÍVEL RISCO'] ?? '',
      pbaObrigatorio: (json['PBA Obrigatório']?.toUpperCase() == 'SIM'),
    );
  }
}
