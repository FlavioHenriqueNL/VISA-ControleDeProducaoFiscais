import 'package:visa_arapiraca_app/domain/entities/fiscal.dart';

abstract class IFiscalRepository {

  // Future<List<Fiscal>?> getAll ();
  // Future<Fiscal?> getByCpf (String cpf);
  // Future<Fiscal?> getByMatricula (String matricula);
  Future<Fiscal?> getByUuid (String uuid);
  Future<void> create (String userID, Fiscal fiscal);
  // Future<void> update (Fiscal fiscal);
  // Future<void> delete (String uuid);

}