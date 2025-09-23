import 'package:visa_arapiraca_app/data/dtos/AuthUserDTO.dart';

abstract class IUserRepository {

  Future<AuthUserDTO?> login(String email, String password);
  Future<void> logout();
  // Future<void> register(String email, String password);
  // Future<void> updatePassword(String uuid, String password);
  // Future<void> delete(String uuid);

}