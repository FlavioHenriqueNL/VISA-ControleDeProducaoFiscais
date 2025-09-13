import 'package:visa_arapiraca_app/data/dtos/CnaeDTO.dart';
import 'package:visa_arapiraca_app/data/dtos/EnderecoDTO.dart';
import 'package:visa_arapiraca_app/domain/entities/estabelecimento.dart';
import 'package:visa_arapiraca_app/domain/entities/termoInspecao.dart';

class TermoInspecaoDTO {
  Estabelecimento estabelecimento;
  EnderecoDTO endereco;
  CnaeDTO cnae;
  TermoInspecao termoInspecao;

  TermoInspecaoDTO({
    required this.estabelecimento,
    required this.endereco,
    required this.cnae,
    required this.termoInspecao
  });
}