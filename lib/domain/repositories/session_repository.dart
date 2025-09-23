import 'package:visa_arapiraca_app/domain/entities/fiscal.dart';

abstract class ISessionManagerRepository{

  Future<void> saveFiscal(Fiscal fiscal); 
  Fiscal? get currentFiscal;
  Future<void> clear();
  Future<void> load();

}