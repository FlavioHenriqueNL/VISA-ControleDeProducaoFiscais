import 'package:flutter/material.dart';
import 'package:visa_arapiraca_app/presentation/widgets/Termos/Componentes/stack_container.dart';

class AssinaturasTermo extends StatelessWidget {
  final String fiscalResponsavel;
  final String matriculaFiscal;

  const AssinaturasTermo({
    required this.fiscalResponsavel,
    required this.matriculaFiscal,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return StackContainer(title: "Ciência", 
      child: Column(
        children: [
          IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      SizedBox(height: 75),
                      Divider(height: 25),
                      Text("Responsável Tecnico e/ou Legal"),
                      Text(""),
                      Text(""),
                      SizedBox(height: 75),
                      Divider(height: 25),
                      Text("Testemunha"),
                      SizedBox(height: 75),
                      Divider(height: 25),
                      Text("Testemunha"),
                      SizedBox(height: 25),
                    ],
                  ),
                ),

                Container(
                  width: 1,
                  color: Colors.grey[400],
                  margin: EdgeInsets.symmetric(horizontal: 50),
                  height: double.infinity, // IntrinsicHeight faz ela ocupar altura total
                ),

                Expanded(
                  child: Column(
                    children: [
                      SizedBox(height: 75),
                      Divider(height: 25),
                      Text(fiscalResponsavel),
                      Text("Matricula nº: $matriculaFiscal"),
                      Text("Fiscal Sanitário Responsável"),
                      SizedBox(height: 75),
                      Divider(height: 25),
                      Text("Fiscal Sanitário"),
                      SizedBox(height: 75),
                      Divider(height: 25),
                      Text("Fiscal Sanitário"),
                      SizedBox(height: 25),
                    ],
                  ),
                ),
              ],
            ),
)
        ],
      )
    );
  }
}