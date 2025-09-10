import 'package:flutter/material.dart';
import 'package:visa_arapiraca_app/models/producao/producao_model.dart';
import 'package:visa_arapiraca_app/presentation/widgets/Componentes/accordion.dart';
import 'package:visa_arapiraca_app/presentation/widgets/producao/producao_criacao_field.dart';

class FieldAccordion extends StatelessWidget {
  final String fieldTitle;
  final TextEditingController controller;
  final List<Notificacoes> notificacaoTypeList;
  final String Function(int index) accordionTitle;

  const FieldAccordion({
    super.key,
    required this.fieldTitle,
    required this.controller,
    required this.notificacaoTypeList,
    required this.accordionTitle
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 25),
        Divider(height: 1),
        SizedBox(height: 25),

        // NOTIFICAÇÕES
        FieldProducao(
          titulo: fieldTitle, 
          controller: controller
        ),
        SizedBox(height: 10),
        if (notificacaoTypeList.isNotEmpty) ...[
          SizedBox(height: 10),
          Accordion<Notificacoes>(
            data: notificacaoTypeList,
            headerBuilder: (context, notificacao, isExpanded) {
              final index = notificacaoTypeList.indexOf(notificacao);
              return ListTile(
                title: Text(accordionTitle(index)),
                subtitle: Text(notificacao.razaoSocial.isEmpty ? "Sem razão social" : notificacao.razaoSocial),
              );
            },
            bodyBuilder: (context, notificacao) {
              final index = notificacaoTypeList.indexOf(notificacao);
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(labelText: "CNPJ"),
                      onChanged: (value) => notificacaoTypeList[index].cnpj = value,
                      controller: TextEditingController.fromValue(TextEditingValue(text: notificacao.cnpj)),
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: "Razão Social"),
                      onChanged: (value) => notificacaoTypeList[index].razaoSocial = value,
                      controller: TextEditingController.fromValue(TextEditingValue(text: notificacao.razaoSocial)),
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: "Motivo"),
                      onChanged: (value) => notificacaoTypeList[index].motivo = value,
                      controller: TextEditingController.fromValue(TextEditingValue(text: notificacao.motivo)),
                    ),
                  ],
                ),
              );
            },
          ),
          SizedBox(height: 15),
        ],
      ],
    );
  }
}