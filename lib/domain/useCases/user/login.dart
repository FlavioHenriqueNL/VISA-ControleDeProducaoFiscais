import 'package:visa_arapiraca_app/domain/repositories/fiscal_repository.dart';
import 'package:visa_arapiraca_app/domain/repositories/session_repository.dart';
import 'package:visa_arapiraca_app/domain/repositories/user_repository.dart';

class LoginUser {
  final IUserRepository repository;
  final IFiscalRepository fiscalRepository;
  final ISessionManagerRepository inMemorySession;
  final ISessionManagerRepository localSession;

  LoginUser(
    this.repository,
    this.fiscalRepository,
    this.inMemorySession,
    this.localSession,
  );

  Future<void> call(String email, String password, {bool manterConectado = false}) async {

    final userID = await repository.login(email, password);
    final fiscal = await fiscalRepository.getByUuid(userID!.uuid);

    print(fiscal!.cpf);

    if(manterConectado){
      await localSession.saveFiscal(fiscal!);
    }else{
      await inMemorySession.saveFiscal(fiscal!);
    }
  }
} 