import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:visa_arapiraca_app/data/models/estabelecimento_model.dart';
import 'package:visa_arapiraca_app/domain/entities/estabelecimento.dart';
import 'package:visa_arapiraca_app/domain/repositories/estabelecimento_repository.dart';


class EstabelecimentoRepository implements EstabelecimentoRepositoryI {

  @override
  Future<Estabelecimento?> getByCnpj(String id) async{
  
    final String jsonString = await rootBundle.loadString(
      'assets/localData/estabelecimentos.json',
    );
    final List<dynamic> jsonList = json.decode(jsonString);

    final List<EstabelecimentoModel> estabelecimentoList = jsonList
        .map((item) => EstabelecimentoModel.fromJson(item))
        .toList();
  
    final modeloFiltrado = estabelecimentoList.where((e) => e.cpfCnpj == id).toList();
   
    if (modeloFiltrado.isEmpty) {
      return null;
    } else {
      final estabelecimentoEncontrado = modeloFiltrado.first;
      return Estabelecimento(
        numeroAlvara: estabelecimentoEncontrado.numeroAlvara,
        cpfCnpj: estabelecimentoEncontrado.cpfCnpj,
        razaoSocial: estabelecimentoEncontrado.razaoSocial,
        nomeFantasia: estabelecimentoEncontrado.nomeFantasia,
        telefone: estabelecimentoEncontrado.telefone,
        email: estabelecimentoEncontrado.email,
        cnae: estabelecimentoEncontrado.cnae,
        cnaesSecundarios: estabelecimentoEncontrado.cnaesSecundarios,
        cep: estabelecimentoEncontrado.cep,
        numeroResidencia: estabelecimentoEncontrado.numeroResidencia,
        complemento: estabelecimentoEncontrado.complemento,
        responsavel: estabelecimentoEncontrado.responsavel,
        cpfResponsavel: estabelecimentoEncontrado.cpfResponsavel,
        codigoConselho: estabelecimentoEncontrado.codigoConselho,
      );
    }
  }

  // @override
  // Future<void> create() {
  //   // TODO: implement create
  //   throw UnimplementedError();
  // }

  // @override
  // Future<void> update(String id) {
  //   // TODO: implement update
  //   throw UnimplementedError();
  // }

  // @override
  // Future<void> delete(String id) {
  //   // TODO: implement delete
  //   throw UnimplementedError();
  // }

  // @override
  // Future<List<Estabelecimento>> getAll() {
  //   // TODO: implement getAll
  //   throw UnimplementedError();
  // }
  

}
