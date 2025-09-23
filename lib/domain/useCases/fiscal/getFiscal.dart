
import 'package:visa_arapiraca_app/domain/entities/fiscal.dart';
import 'package:visa_arapiraca_app/domain/repositories/fiscal_repository.dart';

class GetFiscal {
  
  final IFiscalRepository repository;

  GetFiscal(this.repository);

  Future<Fiscal?> getByUuid(String uuid) async {
    return await repository.getByUuid(uuid);    
  }
}