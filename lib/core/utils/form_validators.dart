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
