import 'package:flutter/material.dart';
import 'package:visa_arapiraca_app/presentation/widgets/forms/formControllers/informacaoEstabelecimentoController.dart';
import 'package:visa_arapiraca_app/presentation/widgets/forms/formControllers/informacaoFiscal_Controller.dart';

class ParecerTecnicoController {
  final Informacaoestabelecimentocontroller informacaoEstabelecimento;
  final InformacaoFiscalController informacaoFiscal;
  final TextEditingController numeroProcesso = TextEditingController();
  final TextEditingController dataEmissaoController = TextEditingController();
  final TextEditingController parecerController = TextEditingController();
  final TextEditingController taxaAlvaraController = TextEditingController();
  final TextEditingController validadeAlvaraController = TextEditingController();

  ParecerTecnicoController() 
  : informacaoEstabelecimento = Informacaoestabelecimentocontroller(),
    informacaoFiscal = InformacaoFiscalController();

  void dispose() {
    parecerController.dispose();
    dataEmissaoController.dispose();
    taxaAlvaraController.dispose();
    validadeAlvaraController.dispose();
    numeroProcesso.dispose();
  }

}