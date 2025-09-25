import 'package:visa_arapiraca_app/domain/entities/fiscal.dart';
import 'package:visa_arapiraca_app/domain/repositories/fiscal_repository.dart';
import 'package:visa_arapiraca_app/domain/repositories/user_repository.dart';

class RegisterUser {
  final IUserRepository userRepository;
  final IFiscalRepository fiscalRepository;

  RegisterUser({
    required this.userRepository,
    required this.fiscalRepository
  });
  
  Future<void> call(String email, String password, Fiscal fiscal) async {
    try {
      final userID = await userRepository.register(email, password);
      if (userID == null) return;

      try {
        await fiscalRepository.create(userID.uuid, fiscal);
      } catch (e) {
        await userRepository.delete(userID.uuid, email, password);
        rethrow;
      }
    } catch (e) {
      // Ideal: use um logger ao invés de print
      print('RegisterUser error: $e');
      rethrow;
    }
  }
}