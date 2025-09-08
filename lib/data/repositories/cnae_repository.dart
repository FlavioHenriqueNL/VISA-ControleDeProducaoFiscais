import 'dart:convert';
import 'package:flutter/services.dart';
import '../../domain/entities/cnae.dart';
import '../models/cnae_model.dart';


class CnaeRepository {
  Future<List<Cnae>> carregarLocal() async{
    final String jsonString = await rootBundle.loadString('assets/localData/cnaes.json');
    final List<dynamic> jsonList = json.decode(jsonString);

    return jsonList.map((item) => CnaeModel.fromJson(item)).toList();
  }



  Future<Cnae?> getCnaeByID(String cnae) async{

    /*  
      TODO: Ver forma de fazer um DTO para CNAE 
      para não precisar carregar 
      (Categoria, nivelRisco e PBAObrigatorio);
    */
    
    List<Cnae> listaCnaes = await carregarLocal();
    final cnaeFiltrado = listaCnaes.where((e) => e.codigo == cnae);
    if(cnaeFiltrado.isNotEmpty){
      final cnaeEncontrado = cnaeFiltrado.first;
      return Cnae(
        codigo: cnaeEncontrado.codigo,
        descricao: cnaeEncontrado.descricao,
        categoria: cnaeEncontrado.categoria,
        nivelRisco: cnaeEncontrado.nivelRisco,
        pbaObrigatorio: cnaeEncontrado.pbaObrigatorio,
      );
    }else{
      return null;
    }
  }
}