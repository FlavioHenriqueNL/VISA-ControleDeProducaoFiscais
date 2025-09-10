import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:visa_arapiraca_app/domain/entities/parecersanitario.dart';
import 'package:visa_arapiraca_app/presentation/widgets/ParecerSanitario/Componentes/identificacaoField_pareceres.dart';

class RodapeParecer extends StatelessWidget {
  final ParecerSanitario parecerSanitario;
  const RodapeParecer({super.key, required this.parecerSanitario});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IdentificacaoField(
              field: "Taxa do Alvará:",
              value: "R\$ ${parecerSanitario.taxa})}",
            ),
            SizedBox(width: 350),
            IdentificacaoField(
              field: "Validade:",
              value: parecerSanitario.validade,
            ),
          ],
        ),
        const SizedBox(height: 150),
        Text(
          "Arapiraca, ${DateTime.now().day} de ${DateFormat('MMMM','pt_BR').format(DateTime.now())} de ${DateTime.now().year}",
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
