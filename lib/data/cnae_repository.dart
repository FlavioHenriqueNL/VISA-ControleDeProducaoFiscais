import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/cnaes/cnaes_model.dart';

class CnaeRepository {
  Future<List<Cnaes>> carregarLocal() async{
    final String jsonString = await rootBundle.loadString('assets/localData/cnaes.json');
    final List<dynamic> jsonList = json.decode(jsonString);

    return jsonList.map((item) => Cnaes.fromJson(item)).toList();
  }
}