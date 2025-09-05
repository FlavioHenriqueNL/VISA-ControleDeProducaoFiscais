import 'package:flutter/material.dart';
import 'package:visa_arapiraca_app/presentation/widgets/ParecerSanitario/Componentes/identificacao_field_pareceres.dart';
import 'package:visa_arapiraca_app/presentation/widgets/ParecerSanitario/Componentes/stack_container.dart';

class IdentificacaoEstabelecimentoParecer extends StatelessWidget {
  const IdentificacaoEstabelecimentoParecer({super.key});

  @override
  Widget build(BuildContext context) {
    return StackContainer(
      title: "Identificação do Estabelecimento",
      child: Column(
        children: [
          IdentificacaoField(field: "Razão Social:"),
          SizedBox(height: 5),
          IdentificacaoField(field: "Nome Fantasia:"),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: IdentificacaoField(field: "CNPJ ou CPF:")),
              Expanded(child: IdentificacaoField(field: "Inscrição Estadual:")),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: IdentificacaoField(field: "CEP:")),
              Expanded(child: IdentificacaoField(field: "Endereço:")),
            ],
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: IdentificacaoField(field: "Telefone:")),
              Expanded(child: IdentificacaoField(field: "E-mail:")),
            ],
          ),
          SizedBox(height: 10),
          IdentificacaoField(field: "Responsável:"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: IdentificacaoField(field: "CPF do Responsável:")),
              Expanded(child: IdentificacaoField(field: "Código do Conselho:")),
            ],
          ),
        ],
      ),
    );
  }
}
