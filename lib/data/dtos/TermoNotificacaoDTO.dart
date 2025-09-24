import 'package:visa_arapiraca_app/data/dtos/CnaeDTO.dart';
import 'package:visa_arapiraca_app/data/dtos/EnderecoDTO.dart';
import 'package:visa_arapiraca_app/domain/entities/estabelecimento.dart';
import 'package:visa_arapiraca_app/domain/entities/notificacao.dart';
class TermoNotificacaoDTO {
  Estabelecimento estabelecimento;
  EnderecoDTO endereco;
  CnaeDTO cnae;
  Notificacao notificacao;

  TermoNotificacaoDTO({
    required this.estabelecimento,
    required this.endereco,
    required this.cnae,
    required this.notificacao
  });
}