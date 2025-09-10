import 'package:flutter/cupertino.dart';

class Termodeinspecaocontroller {
  final dataInspecaoController = TextEditingController();
  final objetoInspecao = TextEditingController();
  final fatoInspecao = TextEditingController();
  final fundamentosLegais = TextEditingController();

  void dispose(){
    dataInspecaoController.dispose();
    objetoInspecao.dispose();
    fatoInspecao.dispose();
    fundamentosLegais.dispose();
  }
}