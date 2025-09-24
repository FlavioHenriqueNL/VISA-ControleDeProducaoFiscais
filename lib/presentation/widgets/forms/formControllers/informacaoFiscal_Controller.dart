import 'package:flutter/widgets.dart';

class InformacaoFiscalController {

  final cpfFiscal = TextEditingController();
  final nomeFiscal = TextEditingController();
  final matriculaFiscal = TextEditingController();
  final emailFiscal = TextEditingController();
  final roleFiscal = TextEditingController();
  final phoneFiscal = TextEditingController();

  void dispose(){
    cpfFiscal.dispose();
    nomeFiscal.dispose();
    matriculaFiscal.dispose();
    emailFiscal.dispose();
    roleFiscal.dispose();
    phoneFiscal.dispose();
  }

}