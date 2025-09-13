import 'package:flutter/material.dart';
import 'package:visa_arapiraca_app/data/dtos/CnaeDTO.dart';
import 'package:visa_arapiraca_app/data/dtos/EnderecoDTO.dart';
import 'package:visa_arapiraca_app/domain/entities/estabelecimento.dart';

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
extension InformacaoEstabelecimentoMapper on Informacaoestabelecimentocontroller{
  Estabelecimento toEntity(){
    return Estabelecimento(
      numeroAlvara: numeroProcessoController.text,
      cpfCnpj: cpfCnpjController.text,
      razaoSocial: razaoSocialController.text,
      nomeFantasia: nomeFantasiaController.text,
      telefone: telefoneController.text,
      email: emailController.text,
      cnae: cnaeController.text,
      cep: cepController.text,
      numeroResidencia: numeroResidenciaController.text,
      complemento: complementoController.text,
      responsavel: responsavelController.text,
      cpfResponsavel: cpfResponsavelController.text,
      codigoConselho:
        codigoConselhoController.text.isNotEmpty
        ? codigoConselhoController.text
        : null,
    );
  }
  CnaeDTO toCnaeDTO() {
    return CnaeDTO(
      codigo: cnaeController.text,
      descricao: cnaeDescricaoController.text,
    );
  }

  EnderecoDTO toEnderecoDTO() {
    return EnderecoDTO(
      cep: cepController.text,
      numeroResidencia: numeroResidenciaController.text,
      logradouro: logradouroController.text,
      complemento: complementoController.text,
      bairro: bairroController.text,
      cidade: cidadeController.text,
    );
  }
}
