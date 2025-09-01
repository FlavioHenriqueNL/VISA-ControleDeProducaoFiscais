import 'package:flutter/material.dart';

class AnaliseTecnicaController {
  final TextEditingController parecerController =
      TextEditingController();
  final TextEditingController dataEmissaoController =
      TextEditingController();
  final TextEditingController taxaAlvaraController =
      TextEditingController();
  final TextEditingController validadeAlvaraController =
      TextEditingController();

  void dispose() {
    parecerController.dispose();
    dataEmissaoController.dispose();
    taxaAlvaraController.dispose();
    validadeAlvaraController.dispose();
  }

}