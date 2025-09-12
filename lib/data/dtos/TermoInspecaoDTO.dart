import 'package:visa_arapiraca_app/domain/entities/estabelecimento.dart';
import 'package:visa_arapiraca_app/domain/entities/termoInspecao.dart';

class TermoInspecaoDTO {
  Estabelecimento estabelecimento;
  TermoInspecao termoInspecao;

  TermoInspecaoDTO({
    required this.estabelecimento,
    required this.termoInspecao
  });
}