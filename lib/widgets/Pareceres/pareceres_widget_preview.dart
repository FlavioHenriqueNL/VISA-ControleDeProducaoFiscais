import 'package:flutter/material.dart';
import 'package:visa_arapiraca_app/widgets/Pareceres/atividades_pareceres.dart';
import 'package:visa_arapiraca_app/widgets/Pareceres/cabecalho_pareceres.dart';
import 'package:visa_arapiraca_app/widgets/Pareceres/identificacao_field_pareceres.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            CabecalhoParecer(),
            Padding(
              padding: EdgeInsetsGeometry.symmetric(
                horizontal: 25,
                vertical: 15,
              ),
              child: Column(
                children: [
                  IdentificacaoField(field: "Razão Social:"),
                  IdentificacaoField(field: "Nome Fantasia:"),
                  IdentificacaoField(field: "CNPJ ou CPF:"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IdentificacaoField(field: "CEP:"),
                      IdentificacaoField(field: "Endereço:"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IdentificacaoField(field: "Telefone:"),
                      IdentificacaoField(field: "E-mail:"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IdentificacaoField(
                        field: "Responsável Tecnico ou Legal:",
                      ),
                      IdentificacaoField(field: "CPF do Responsável:"),
                    ],
                  ),
                ],
              ),
            ),
            AtividadesParecer(atividadePrincipal: {"4771071": "Farmácias"}),
          ],
        ),
      ),
    ),
  );
}
