import 'package:flutter/material.dart';
import 'package:visa_arapiraca_app/presentation/widgets/formControllers/informacaoEstabelecimentoController.dart';

class ParecerTecnicoController {
  final Informacaoestabelecimentocontroller informacaoEstabelecimento;
  final TextEditingController numeroProcesso = TextEditingController();
  final TextEditingController dataEmissaoController = TextEditingController();
  final TextEditingController parecerController = TextEditingController();
  final TextEditingController taxaAlvaraController = TextEditingController();
  final TextEditingController validadeAlvaraController = TextEditingController();

  ParecerTecnicoController() : informacaoEstabelecimento = Informacaoestabelecimentocontroller();

  void dispose() {
    parecerController.dispose();
    dataEmissaoController.dispose();
    taxaAlvaraController.dispose();
    validadeAlvaraController.dispose();
    numeroProcesso.dispose();
  }

}