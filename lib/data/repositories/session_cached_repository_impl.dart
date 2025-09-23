import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:visa_arapiraca_app/domain/entities/fiscal.dart';
import 'package:visa_arapiraca_app/domain/repositories/session_repository.dart';

class SessionCachedRepository implements ISessionManagerRepository {

static const _key = 'fiscal_session';
  Fiscal? _fiscal;

  @override
  Future<void> saveFiscal(Fiscal fiscal) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonData = jsonEncode({
      "cpf": fiscal.cpf,
      "nome": fiscal.nome,
      "matricula": fiscal.matricula,
      "email": fiscal.email,
      "role": fiscal.role,
      "isAdmin": fiscal.isAdmin,
      "phone": fiscal.phone,  
    });
    await prefs.setString(_key, jsonData);
    _fiscal = fiscal;
  }

  @override
  Fiscal? get currentFiscal => _fiscal;

  @override
  Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
    _fiscal = null;
  }

  @override
  Future<Fiscal?> load() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonData = prefs.getString(_key);
    if (jsonData != null) {
      final map = jsonDecode(jsonData);
      _fiscal = Fiscal(
        cpf: map["cpf"],
        nome: map["nome"],
        matricula: map["matricula"],
        email: map["email"],
        role: map["role"],
        isAdmin: map["isAdmin"],
        phone: map["phone"],
      );
      return _fiscal;
    }
    return null;
  }
}