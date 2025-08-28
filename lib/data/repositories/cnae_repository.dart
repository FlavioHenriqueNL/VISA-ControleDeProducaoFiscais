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
}