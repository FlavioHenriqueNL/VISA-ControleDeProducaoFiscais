import 'package:flutter/widgets.dart';

class InformacaoFiscalController {

  final cpfFiscal = TextEditingController();
  final nomeFiscal = TextEditingController();
  final matriculaFiscal = TextEditingController();
  final emailFiscal = TextEditingController();
  final roleFiscal = TextEditingController();
  final phoneFiscal = TextEditingController();
  final senhaFiscal = TextEditingController();

  void dispose(){
    cpfFiscal.dispose();
    nomeFiscal.dispose();
    matriculaFiscal.dispose();
    emailFiscal.dispose();
    senhaFiscal.dispose();
    roleFiscal.dispose();
    phoneFiscal.dispose();
  }

}