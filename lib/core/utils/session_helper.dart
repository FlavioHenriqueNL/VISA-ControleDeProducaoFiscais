import 'package:visa_arapiraca_app/domain/entities/fiscal.dart';
import 'package:visa_arapiraca_app/domain/repositories/session_repository.dart';

class SessionHelper {
  final ISessionManagerRepository session;
  Fiscal? _currentFiscal;

  SessionHelper(this.session);

  Fiscal? get currentFiscal => _currentFiscal;
  Future<void> loadSession() async { _currentFiscal = await session.load();}
  Future<void> saveFiscal(Fiscal fiscal) async {await session.saveFiscal(fiscal);}
  Future<void> clearSession() async {_currentFiscal = null; await session.clear();}
  bool get hasFiscal => _currentFiscal != null;

}

class StaticSessionHelper {
  static final StaticSessionHelper _instance = StaticSessionHelper._internal();

  factory StaticSessionHelper() => _instance;

  StaticSessionHelper._internal();

  ISessionManagerRepository? _session;
  Fiscal? _currentFiscal;

  void setSession(ISessionManagerRepository session) {
    _session = session;
  }

  Fiscal? get currentFiscal => _currentFiscal;

  Future<void> loadSession() async {
    if (_session != null) {
      _currentFiscal = await _session!.load();
    }
  }

  Future<void> saveFiscal(Fiscal fiscal) async {
    _currentFiscal = fiscal;
    if (_session != null) {
      await _session!.saveFiscal(fiscal);
    }
  }

  Future<void> clear() async {
    _currentFiscal = null;
    await _session?.clear();
  }
}