import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:visa_arapiraca_app/data/models/estabelecimento_model.dart';
import 'package:visa_arapiraca_app/domain/entities/estabelecimento.dart';
import 'package:visa_arapiraca_app/domain/repositories/estabelecimento_repository.dart';

class EstabelecimentoFirestoreRepository implements IEstabelecimentoRepository {
  final _firestore = FirebaseFirestore.instance;

  
  @override
  Future<List<Estabelecimento>?> getAllByCnpj(String id) async{
      try {
        QuerySnapshot snapshot = await _firestore
          .collection('estabelecimentos')
          .where('cpfCnpj', isEqualTo: id)
          .get();

        if (snapshot.docs.isEmpty) {
          final idSemZeros = id.replaceFirst(RegExp(r'^0+'), '');
          snapshot = await _firestore
            .collection('estabelecimentos')
            .where('cpfCnpj', isEqualTo: idSemZeros)
            .get();
          if (snapshot.docs.isEmpty) {
            throw Exception("Estabelecimento não encontrado");
          }
        }

        List<EstabelecimentoModel> estabelecimentosModelData = snapshot.docs.map((doc) => EstabelecimentoModel.fromJson(doc.data() as Map<String, dynamic>)).toList();
        List<Estabelecimento> estabelecimentos = estabelecimentosModelData.map((model) => model.toEntity()).toList();
        
        return estabelecimentos;

      } catch (error) {
        throw Exception("Erro ao buscar estabelecimento: $error");
      }

  }

  @override
  Future<Estabelecimento?> getByCnpj(String id) {
    // TODO: implement getByCnpj
    throw UnimplementedError();
  }
}