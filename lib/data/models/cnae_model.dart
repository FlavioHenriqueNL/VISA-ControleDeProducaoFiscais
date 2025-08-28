import '../../domain/entities/cnae.dart';

class CnaeModel extends Cnae {
  CnaeModel({
    required super.codigo,
    required super.descricao,
    required super.categoria,
    required super.nivelRisco,
    required super.pbaObrigatorio,
  });

  factory CnaeModel.fromJson(Map<String, dynamic> json) {
    return CnaeModel(
      codigo: json['CNAE'] ?? '',
      descricao: json['DESCRIÇÃO'] ?? '',
      categoria: json['CATEGORIA'] ?? '',
      nivelRisco: json['NÍVEL RISCO'] ?? '',
      pbaObrigatorio: (json['PBA Obrigatório']?.toUpperCase() == 'SIM'),
    );
  }

  Map<String, dynamic> toJson() => {
    'CNAE': codigo,
    'DESCRIÇÃO': descricao,
    'CATEGORIA': categoria,
    'NÍVEL RISCO': nivelRisco,
    'PBA Obrigatório': pbaObrigatorio ? "SIM" : "NÃO"
  };
}