import 'package:flutter/material.dart';

class Informacaoestabelecimentocontroller {
  // Identificação e contato do estabelecimento
  final numeroProcessoController = TextEditingController();
  final cpfCnpjController = TextEditingController();
  final razaoSocialController = TextEditingController();
  final nomeFantasiaController = TextEditingController();
  final telefoneController = TextEditingController();
  final emailController = TextEditingController();
  // Atividades do Estabelecimento
  final cnaeController = TextEditingController();
  final cnaeDescricaoController = TextEditingController();
  // Localização do Estabelecimento
  final cepController = TextEditingController();
  final logradouroController = TextEditingController();
  final numeroResidenciaController = TextEditingController();
  final bairroController = TextEditingController();
  final cidadeController = TextEditingController();
  final complementoController = TextEditingController();
  // Responsável Legal ou Técnico do Estbelecimento
  final responsavelController = TextEditingController();
  final cpfResponsavelController = TextEditingController();
  final codigoConselhoController = TextEditingController();

  void dispose() {
    numeroProcessoController.dispose();
    cpfCnpjController.dispose();
    razaoSocialController.dispose();
    nomeFantasiaController.dispose();
    telefoneController.dispose();
    emailController.dispose();
    cnaeController.dispose();
    cnaeDescricaoController.dispose();
    cepController.dispose();
    logradouroController.dispose();
    numeroResidenciaController.dispose();
    bairroController.dispose();
    cidadeController.dispose();
    complementoController.dispose();
    responsavelController.dispose();
    cpfResponsavelController.dispose();
    codigoConselhoController.dispose();
  }
}
