import 'package:visa_arapiraca_app/domain/entities/estabelecimento.dart';
import 'package:visa_arapiraca_app/domain/repositories/estabelecimento_repository.dart';

class GetEstabelecimento {
  final IEstabelecimentoRepository repository;

  GetEstabelecimento(this.repository);

  Future<Estabelecimento?> call(String id) async{

    final estabelecimento = await repository.getByCnpj(id);
    return estabelecimento;
  }

  Future<List<Estabelecimento>?> all(String id) async{

    final estabelecimentos = await repository.getAllByCnpj(id);
    return estabelecimentos;
  }
}