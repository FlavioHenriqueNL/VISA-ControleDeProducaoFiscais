String? campoVazio(String? nomeCampo, String? value) {
  if (value == null || value.isEmpty) {
    return "O campo $nomeCampo é de preenchimento obrigatório!";
  }
  return null;
}

String? validarEmail(String? nomeCampo, String? value) {
  campoVazio(nomeCampo, value);

  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  if (!emailRegex.hasMatch(value!)) {
    return "Insira um email válido";
  }

  return null;
}

String? validarCEP(String? nomeCampo, String? value) {
  campoVazio(nomeCampo, value);

  final cepRegExp = RegExp(r'^\d{5}-?\d{3}$');
  if (!cepRegExp.hasMatch(value!)) {
    return "Insira um cep válido";
  }
  return null;
}

String? validarTelefone(String? nomeCampo, String? value) {
  campoVazio(nomeCampo, value);

  final telefoneRegExp = RegExp(r'^\(?\d{2}\)?[\s-]?[\s9]?\d{4}-?\d{4}$');
  if (!telefoneRegExp.hasMatch(value!)) {
    return "Insira um telefone válido";
  }
  return null;
}

String? validarCpfCnpj(String nomeCampo, String? value) {
  
  campoVazio(nomeCampo, value);

  final digits = value!.replaceAll(RegExp(r'[^0-9]'), '');
  if (digits.length != 11 && digits.length != 14) return 'CPF ou CNPJ inválido';

  return null;
}


