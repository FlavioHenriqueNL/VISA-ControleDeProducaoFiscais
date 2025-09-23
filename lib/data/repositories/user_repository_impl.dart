import 'package:firebase_auth/firebase_auth.dart';
import 'package:visa_arapiraca_app/data/dtos/AuthUserDTO.dart';
import 'package:visa_arapiraca_app/domain/repositories/user_repository.dart';

class UserRepository implements IUserRepository{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<AuthUserDTO?> login(String email, String password) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = credential.user;
      if (user == null) return null;
      print("Deu certo aqui: ${user!.email}");
      return AuthUserDTO(email: user.email ?? "", uuid: user.uid);
    } on FirebaseAuthException catch (e) {
      print("Erro de autenticação: ${e.code}");
      throw Exception(e.message);
    }
  }

  @override
  Future<void> logout() async{
    return await _auth.signOut();
  }

}