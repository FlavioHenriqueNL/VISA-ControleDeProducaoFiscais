import 'package:visa_arapiraca_app/domain/entities/estabelecimento.dart';
import 'package:visa_arapiraca_app/domain/entities/parecersanitario.dart';

class ParecerDTO {
  Estabelecimento estabelecimento;
  ParecerSanitario parecerSanitario;
  ParecerDTO({required this.estabelecimento, required this.parecerSanitario});
}
