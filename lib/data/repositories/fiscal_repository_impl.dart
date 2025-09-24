import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:visa_arapiraca_app/data/models/fiscal_model.dart';
import 'package:visa_arapiraca_app/domain/entities/fiscal.dart';
import 'package:visa_arapiraca_app/domain/repositories/fiscal_repository.dart';

class FiscalRepository implements IFiscalRepository{

final _firestore = FirebaseFirestore.instance;

@override
Future<Fiscal?> getByUuid(String uuid) async {
  
  print("Está tentando fazer o get de fiscal");

  DocumentSnapshot doc = await _firestore.collection('fiscal').doc(uuid).get();

  print(doc);

  if(!doc.exists){
    throw Exception("Fiscal não encontrado, contacte o administrador.");
  }

  final data = doc.data() as Map<String, dynamic>;

  print(data);


  return Fiscal(
    cpf: data['cpf'], 
    nome: data['nome'], 
    matricula: data['matricula'],
    role: data['role'] ?? "", 
    email: data['email'], 
    isAdmin: data['isAdmin'] ?? false,
    phone: data['phone'] ?? ""
  );
  
}

@override
Future<void> create (String uuid, Fiscal fiscal) async {

  FiscalModel modelFiscal = FiscalModel.fromEntity(fiscal);
  final data = modelFiscal.toJson();

  try{
    await _firestore.collection("fiscal").doc(uuid).set(
      data
    );
  } on FirebaseException catch (e){
    print(e.message);
    throw Exception(e.message);
  }
}



}