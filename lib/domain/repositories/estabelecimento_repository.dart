import 'package:visa_arapiraca_app/domain/entities/estabelecimento.dart';

abstract class EstabelecimentoRepository {

  Future<Estabelecimento?> getByCnpj(String id);
  // Future<List<Estabelecimento>> getAll();
  // Future<void> create(Estabelecimento estabelecimento);
  // Future<void> update(Estabelecimento estabelecimento);
  // Future<void> delete(String id); 

}