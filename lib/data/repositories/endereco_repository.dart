import 'dart:convert';

import 'package:search_cep/search_cep.dart';
import 'package:visa_arapiraca_app/data/dtos/EnderecoDTO.dart';

class EnderecoRepository {
  Future<EnderecoDTO?> getEnderecoByCEP(String cep) async {
    final searchCep = ViaCepSearchCep();
    final getInfoCepObjectEither = await searchCep.searchInfoByCep(cep: cep);
    getInfoCepObjectEither.fold(
      (error) {
        return null;
      },
      (info) {
        print("Cep: ${info.cep}, Rua: ${info.logradouro}, ${info.bairro}");
        return EnderecoDTO(
          cep: info.cep,
          logradouro: info.logradouro,
          bairro: info.bairro,
        );
      },
    );
  }
}
