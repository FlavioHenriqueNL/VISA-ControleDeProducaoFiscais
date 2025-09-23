import 'package:visa_arapiraca_app/domain/entities/fiscal.dart';

abstract class FiscalRepositoryI {

  Future<List<Fiscal>?> getAll ();
  Future<Fiscal?> getByCpf (String cpf);
  Future<Fiscal?> getByMatricula (String matricula);
  
  // Future<void> create (Fiscal fiscal, String uuid);
  // Future<void> update (Fiscal fiscal);
  // Future<void> delete (String uuid);

}