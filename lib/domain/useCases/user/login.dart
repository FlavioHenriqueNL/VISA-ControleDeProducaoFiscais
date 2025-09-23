import 'package:visa_arapiraca_app/core/utils/session_helper.dart';
import 'package:visa_arapiraca_app/domain/repositories/fiscal_repository.dart';
import 'package:visa_arapiraca_app/domain/repositories/session_repository.dart';
import 'package:visa_arapiraca_app/domain/repositories/user_repository.dart';

class LoginUser {

  final IUserRepository repository;
  final IFiscalRepository fiscalRepository;
  
  LoginUser(
    this.repository,
    this.fiscalRepository,
    
  );

  Future<void> call(String email, String password, ISessionManagerRepository session) async {

    final userID = await repository.login(email, password);
    if (userID == null) throw Exception("Usuário ou senha inválidos");
    final fiscal = await fiscalRepository.getByUuid(userID.uuid);
    if (fiscal == null) throw Exception("Fiscal não encontrado");
    
    final helper = StaticSessionHelper();
    helper.setSession(session);

    await helper.saveFiscal(fiscal);
  }
} 