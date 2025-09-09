import 'dart:convert';

import 'package:search_cep/search_cep.dart';
import 'package:visa_arapiraca_app/data/dtos/EnderecoDTO.dart';

class EnderecoRepository {
  Future<EnderecoDTO?> getEnderecoByCEP(String cep) async {
  final searchCep = ViaCepSearchCep();
  final getInfoCepObjectEither = await searchCep.searchInfoByCep(cep: cep);

  return getInfoCepObjectEither.fold(
    (error) => null,
    (info) {
      // Tratando strings vazias
      var logradouro = (info.logradouro ?? "").trim();
      var bairro = (info.bairro ?? "").trim();
      var cidade = (info.localidade ?? "").trim();

      if (logradouro.isEmpty || bairro.isEmpty || cidade.isEmpty) {
  // verifica individualmente
        if (logradouro.isEmpty) {
          print("Logradouro vazio");
          // ação específica, ex: avisar usuário
          logradouro = "Não especificado";
        }

        if (bairro.isEmpty) {
          print("Bairro vazio");
          bairro = "Não especificado";
          // ação específica
        }

        if (cidade.isEmpty) {
          print("Cidade vazia");
          // ação específica
          cidade = "Arapiraca";
        }

        // se quiser tratar como erro geral:
        return null;
      }

      print(info);


      return EnderecoDTO(
        cep: info.cep ?? "",
        logradouro: logradouro,
        bairro: bairro,
        cidade: cidade,
      );
    },
  );
}

}
