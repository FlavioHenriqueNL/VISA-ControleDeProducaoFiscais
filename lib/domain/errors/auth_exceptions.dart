class AuthException implements Exception {
  final String message;
  AuthException(this.message);

  @override
  String toString() => message;
}

class InvalidEmailException extends AuthException {
  InvalidEmailException() : super("O email fornecido é inválido.");
}

class UserNotFoundException extends AuthException {
  UserNotFoundException() : super("Seu email ou sua senha estão incorretos.");
}

class WrongPasswordException extends AuthException {
  WrongPasswordException() : super("Senha incorreta. Tente novamente.");
}

class EmailAlreadyExistsException extends AuthException {
  EmailAlreadyExistsException() : super("Este email já está em uso.");
}


