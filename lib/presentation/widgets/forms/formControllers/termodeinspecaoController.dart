import 'package:flutter/cupertino.dart';

class Termodeinspecaocontroller {
  final dataInspecaoController = TextEditingController();
  final horaInspecaoController = TextEditingController();
  final objetoInspecao = TextEditingController();
  final fatoInspecao = TextEditingController();
  final fundamentosLegais = TextEditingController();
  final fiscalResponsavel = TextEditingController();
  final matriculaFiscal = TextEditingController();

  void dispose(){
    dataInspecaoController.dispose();
    horaInspecaoController.dispose();
    objetoInspecao.dispose();
    fatoInspecao.dispose();
    fundamentosLegais.dispose();
  }
}