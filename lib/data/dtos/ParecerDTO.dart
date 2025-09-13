import 'package:visa_arapiraca_app/data/dtos/CnaeDTO.dart';
import 'package:visa_arapiraca_app/data/dtos/EnderecoDTO.dart';
import 'package:visa_arapiraca_app/domain/entities/estabelecimento.dart';
import 'package:visa_arapiraca_app/domain/entities/parecersanitario.dart';

class ParecerDTO {
  Estabelecimento estabelecimento;
  ParecerSanitario parecerSanitario;
  EnderecoDTO endereco;
  CnaeDTO cnae;

  ParecerDTO({
    required this.estabelecimento, 
    required this.endereco, 
    required this.parecerSanitario,
    required this.cnae,
  });
}
