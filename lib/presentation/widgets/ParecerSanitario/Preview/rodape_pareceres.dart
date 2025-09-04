import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:visa_arapiraca_app/presentation/widgets/ParecerSanitario/Componentes/identificacao_field_pareceres.dart';

class RodapeParecer extends StatelessWidget {
  const RodapeParecer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: IdentificacaoField(
                field: "Taxa do Alvará:",
                value: "R\$ 0,00",
              ),
            ),
            Expanded(child: IdentificacaoField(field: "Validade:")),
          ],
        ),
        const SizedBox(height: 20),
        Text(
          "Arapiraca, ${DateTime.now().day} de ${DateFormat('MMMM').format(DateTime.now())} de ${DateTime.now().year}",
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 10),
        Text(
          "Flávio Henrique Nunes Leite - Fiscal Sanitário Municipal Mat. 107363",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const Text(
          'Este é um documento emitido eletronicamente e válido sem assinatura.',
          style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
