import 'package:visa_arapiraca_app/domain/entities/estabelecimento.dart';
import 'package:visa_arapiraca_app/domain/repositories/estabelecimento_repository.dart';

class CreateEstabelecimento {
  final EstabelecimentoRepository repository;

  CreateEstabelecimento(this.repository);

  Future<void> call(Estabelecimento estabelecimento) async{
    throw UnimplementedError();
  }
}