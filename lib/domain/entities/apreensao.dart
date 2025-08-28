import 'package:visa_arapiraca_app/domain/entities/itemapreendido.dart';

class Apreensao {
  final String id;
  final String cnpj;
  final DateTime data;
  final String fundamentoLegal;
  final String descricao;
  final String lavratura;
  final List<ItemApreendido> itensApreendidos;

  Apreensao({
    required this.id,
    required this.cnpj,
    required this.data,
    required this.fundamentoLegal,
    required this.descricao,
    required this.lavratura,
    required this.itensApreendidos
  });
}