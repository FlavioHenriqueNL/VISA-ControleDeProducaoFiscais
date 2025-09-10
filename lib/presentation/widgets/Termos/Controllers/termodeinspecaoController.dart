import 'package:flutter/cupertino.dart';
import 'package:visa_arapiraca_app/presentation/widgets/forms/formControllers/informacaoEstabelecimentoController.dart';

class TermoInspecaoController {
  final Informacaoestabelecimentocontroller informacaoEstabelecimento;
  final dataInspecaoController = TextEditingController();
  final horaInspecaoController = TextEditingController();
  final objetoInspecao = TextEditingController();
  final fatoInspecao = TextEditingController();
  final fundamentosLegais = TextEditingController();
  final fiscalResponsavel = TextEditingController();
  final matriculaFiscal = TextEditingController();

  TermoInspecaoController() : informacaoEstabelecimento = Informacaoestabelecimentocontroller();

  void dispose(){
    dataInspecaoController.dispose();
    horaInspecaoController.dispose();
    objetoInspecao.dispose();
    fatoInspecao.dispose();
    fundamentosLegais.dispose();
  }
}