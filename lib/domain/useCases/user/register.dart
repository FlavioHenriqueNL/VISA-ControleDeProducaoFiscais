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
  
  Future<void> call (String email, String password, Fiscal fiscal) async {
    final String userID = await userRepository.register(email, password);
    final newFiscal = await fiscalRepository.create(userID, fiscal);

  }

}