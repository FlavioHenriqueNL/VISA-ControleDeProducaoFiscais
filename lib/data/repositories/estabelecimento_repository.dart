import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:visa_arapiraca_app/data/models/estabelecimento_model.dart';
import 'package:visa_arapiraca_app/domain/entities/estabelecimento.dart';

class EstabelecimentoRepository {
  Future<Estabelecimento?> getEstabelecimentoByCpfCnpj(String cnpj) async {
    print("Entrou na função com o valor: $cnpj");
    final String jsonString = await rootBundle.loadString(
      '/localData/estabelecimentos.json',
    );
    print("Imprimiu o json $jsonString");
    final List<dynamic> jsonList = json.decode(jsonString);

    final List<EstabelecimentoModel> estabelecimentoList = jsonList
        .map((item) => EstabelecimentoModel.fromJson(item))
        .toList();
    print("Aqui já é ele convertodo pra Lista de Model $estabelecimentoList");
    for (var e in estabelecimentoList) {
      print('CNPJ: "${e.cpfCnpj}"');
    }
    final modeloFiltrado = estabelecimentoList.where((e) => e.cpfCnpj == cnpj);
    print("Esse é o valor encontrado: $modeloFiltrado");

    if (modeloFiltrado.isEmpty) {
      print("Retornou vazio por algum motivo.");
      return null;
    } else {
      final estabelecimentoEncontrado = modeloFiltrado.first;
      print(estabelecimentoEncontrado.cpfResponsavel);
      return Estabelecimento(
        numeroAlvara: estabelecimentoEncontrado.numeroAlvara,
        cpfCnpj: estabelecimentoEncontrado.cpfCnpj,
        razaoSocial: estabelecimentoEncontrado.razaoSocial,
        nomeFantasia: estabelecimentoEncontrado.nomeFantasia,
        telefone: estabelecimentoEncontrado.telefone,
        email: estabelecimentoEncontrado.email,
        cnae: estabelecimentoEncontrado.cnae,
        cep: estabelecimentoEncontrado.cep,
        numeroResidencia: estabelecimentoEncontrado.numeroResidencia,
        complemento: estabelecimentoEncontrado.complemento,
        responsavel: estabelecimentoEncontrado.responsavel,
        cpfResponsavel: estabelecimentoEncontrado.cpfResponsavel,
        codigoConselho: estabelecimentoEncontrado.codigoConselho,
      );
    }
  }
}
