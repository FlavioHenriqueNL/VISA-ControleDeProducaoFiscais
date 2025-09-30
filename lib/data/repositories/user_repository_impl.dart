import 'package:firebase_auth/firebase_auth.dart';
import 'package:visa_arapiraca_app/data/dtos/AuthUserDTO.dart';
import 'package:visa_arapiraca_app/domain/errors/auth_exceptions.dart';
import 'package:visa_arapiraca_app/domain/repositories/user_repository.dart';

class UserRepository implements IUserRepository{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential> getCredentialAuth(String email, String password) async{
    try {
      final credential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return credential;
    } on FirebaseAuthException catch (e) {
      throw _mapFirebaseAuthExceptionToAuthException(e);
    }  
  }

  @override
  Future<AuthUserDTO?> login(String email, String password) async {
    final credential = await getCredentialAuth(email, password);
    final user = credential.user;
    if (user == null) return null;
    return AuthUserDTO(email: user.email ?? "", uuid: user.uid);
  }

  @override
  Future<AuthUserDTO?> register(String email, String password) async{
    try{
      final credential = await _auth.createUserWithEmailAndPassword( 
        email: email, 
        password: password
      );

      return AuthUserDTO(email: email, uuid: credential.user!.uid);
    }on FirebaseAuthException catch (e){
      throw Exception(e.message);
    }
  }
  @override
  Future<void> delete(String? uuid, String? email, String? password) {
    return getCredentialAuth(email!, password!).then((value) async {
      await value.user?.delete();
    });
  }
  

  @override
  Future<void> logout() async{
    return await _auth.signOut();
  }

  AuthException _mapFirebaseAuthExceptionToAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
        return InvalidEmailException();
      case 'user-not-found':
        return UserNotFoundException();
      case 'wrong-password':
        return WrongPasswordException();
      case 'email-already-in-use':
        return EmailAlreadyExistsException();
      default:
        return AuthException("Erro de autenticação: ${e.message}");
    }
  }

}