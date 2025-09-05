import 'package:flutter/material.dart';
import 'package:visa_arapiraca_app/domain/entities/estabelecimento.dart';
import 'package:visa_arapiraca_app/presentation/widgets/ParecerSanitario/Componentes/identificacao_field_pareceres.dart';
import 'package:visa_arapiraca_app/presentation/widgets/ParecerSanitario/Componentes/stack_container.dart';

class IdentificacaoEstabelecimentoParecer extends StatelessWidget {
  final Estabelecimento estabelecimento;
  final String? numeroProcesso;
  const IdentificacaoEstabelecimentoParecer({
    required this.estabelecimento,
    this.numeroProcesso,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return StackContainer(
      title: "Identificação do Estabelecimento",
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: IdentificacaoField(field: "CNPJ ou CPF:", value: estabelecimento.cpfCnpj)),
              Expanded(child: IdentificacaoField(field: "Número do Processo", value: numeroProcesso)),
      
            ],
          ),
          SizedBox(height: 5),
          IdentificacaoField(field: "Razão Social:", value: estabelecimento.razaoSocial),
          SizedBox(height: 5),
          IdentificacaoField(field: "Nome Fantasia:", value: estabelecimento.nomeFantasia),
          
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: IdentificacaoField(field: "CEP:", value: estabelecimento.cep,)),
              Expanded(child: IdentificacaoField(field: "Endereço:")),
            ],
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: IdentificacaoField(field: "Telefone:", value: estabelecimento.telefone,)),
              Expanded(child: IdentificacaoField(field: "E-mail:", value: estabelecimento.email)),
            ],
          ),
          SizedBox(height: 10),
          IdentificacaoField(field: "Responsável:", value: estabelecimento.responsavel),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: IdentificacaoField(field: "CPF do Responsável:", value: estabelecimento.cpfResponsavel,)),
              Expanded(child: IdentificacaoField(field: "Código do Conselho:", value: estabelecimento.codigoConselho ?? "N/A")),
            ],
          ),
        ],
      ),
    );
  }
}
