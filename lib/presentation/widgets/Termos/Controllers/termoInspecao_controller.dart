import 'package:flutter/cupertino.dart';
import 'package:visa_arapiraca_app/presentation/widgets/forms/formControllers/informacaoEstabelecimentoController.dart';

class TermoInspecaoController {
  final Informacaoestabelecimentocontroller informacaoEstabelecimento;
  final TextEditingController identificacaoTermo = TextEditingController();
  final TextEditingController dataInspecaoController = TextEditingController();
  final TextEditingController horaInspecaoController = TextEditingController();
  final TextEditingController objetoInspecao = TextEditingController();
  final TextEditingController fatoInspecao = TextEditingController();
  final TextEditingController fundamentosLegais = TextEditingController();
  final TextEditingController fiscalResponsavel = TextEditingController(); 
  final TextEditingController matriculaFiscal = TextEditingController();

  TermoInspecaoController() : informacaoEstabelecimento = Informacaoestabelecimentocontroller();

  void dispose(){
    identificacaoTermo.dispose();
    dataInspecaoController.dispose();
    horaInspecaoController.dispose();
    objetoInspecao.dispose();
    fatoInspecao.dispose();
    fundamentosLegais.dispose();
  }
}