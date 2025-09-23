import 'package:visa_arapiraca_app/data/dtos/AuthUserDTO.dart';
import 'package:visa_arapiraca_app/domain/repositories/user_repository.dart';

class Login {
  final IUserRepository repository;
  Login(this.repository);

  Future<AuthUserDTO?> call(String email, String password) async {
    return await repository.login(email, password);
  }
}