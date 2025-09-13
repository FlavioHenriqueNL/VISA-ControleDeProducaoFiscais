import 'package:flutter/material.dart';
import 'package:visa_arapiraca_app/data/dtos/CnaeDTO.dart';
import 'package:visa_arapiraca_app/data/dtos/EnderecoDTO.dart';
import 'package:visa_arapiraca_app/domain/entities/estabelecimento.dart';
import 'package:visa_arapiraca_app/presentation/widgets/termos/Componentes/identificacaoField_preview.dart';
import 'package:visa_arapiraca_app/presentation/widgets/termos/Componentes/stack_container.dart';

class IdentificacaoEstabelecimentoParecer extends StatelessWidget {
  
  final Estabelecimento estabelecimento;
  final EnderecoDTO endereco;
  final String? numeroProcesso;
  
  const IdentificacaoEstabelecimentoParecer({
    required this.estabelecimento,
    required this.endereco,
    this.numeroProcesso,
    super.key,
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
              Expanded(
                child: IdentificacaoField(
                  field: "CNPJ ou CPF:",
                  value: estabelecimento.cpfCnpj,
                ),
              ),
              Expanded(
                child: IdentificacaoField(
                  field: "Número do Processo",
                  value: estabelecimento.numeroAlvara ?? "N/A",
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          IdentificacaoField(
            field: "Razão Social:",
            value: estabelecimento.razaoSocial,
          ),
          SizedBox(height: 5),
          IdentificacaoField(
            field: "Nome Fantasia:",
            value: estabelecimento.nomeFantasia,
          ),

          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: IdentificacaoField(
                  field: "CEP:",
                  value: endereco.cep,
                ),
              ),
              Expanded(child: IdentificacaoField(
                field: "Endereço:",
                value: "${endereco.logradouro}, ${endereco.numeroResidencia},${endereco.bairro}"
              )),
            ],
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: IdentificacaoField(
                  field: "Telefone:",
                  value: estabelecimento.telefone,
                ),
              ),
              Expanded(
                child: IdentificacaoField(
                  field: "E-mail:",
                  value: estabelecimento.email,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          IdentificacaoField(
            field: "Responsável:",
            value: estabelecimento.responsavel,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: IdentificacaoField(
                  field: "CPF do Responsável:",
                  value: estabelecimento.cpfResponsavel,
                ),
              ),
              Expanded(
                child: IdentificacaoField(
                  field: "Código do Conselho:",
                  value: estabelecimento.codigoConselho ?? "N/A",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
