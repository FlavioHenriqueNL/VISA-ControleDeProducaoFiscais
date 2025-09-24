import 'package:flutter/material.dart';
import 'package:visa_arapiraca_app/presentation/widgets/forms/formControllers/informacaoEstabelecimentoController.dart';

class TermoNotificacaoController {

  final Informacaoestabelecimentocontroller informacaoEstabelecimento;  
  final TextEditingController numeroDocumentoController = TextEditingController();
  final TextEditingController dataInspecaoController = TextEditingController();
  final TextEditingController horaInspecaoController = TextEditingController();
  final TextEditingController exigenciasController = TextEditingController();
  final TextEditingController fundamentosLegaisController = TextEditingController();
  final TextEditingController prazoController = TextEditingController();
  final TextEditingController observacoesController = TextEditingController();
  final TextEditingController fiscalResponsavel = TextEditingController(); 
  final TextEditingController matriculaFiscal = TextEditingController();

  TermoNotificacaoController() : informacaoEstabelecimento = Informacaoestabelecimentocontroller();

  void dispose(){
    numeroDocumentoController.dispose();
    dataInspecaoController.dispose();
    horaInspecaoController.dispose();
    exigenciasController.dispose();
    fundamentosLegaisController.dispose();
    prazoController.dispose();
    observacoesController.dispose();
    fiscalResponsavel.dispose();
    matriculaFiscal.dispose();
  }

}