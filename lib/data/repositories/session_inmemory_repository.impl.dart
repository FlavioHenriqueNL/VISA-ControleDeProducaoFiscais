import 'package:visa_arapiraca_app/domain/entities/fiscal.dart';
import 'package:visa_arapiraca_app/domain/repositories/session_repository.dart';

class SessionInMemoryManager implements ISessionManagerRepository{

  Fiscal? _fiscal;

  @override
  Future<void> saveFiscal(Fiscal fiscal) async {
    _fiscal = fiscal;
  }

  @override
  Future<void> clear() async{
    _fiscal = null;
  }

  @override
  Future<Fiscal?> load() async => _fiscal;

  @override
  Fiscal? get currentFiscal => _fiscal;
}