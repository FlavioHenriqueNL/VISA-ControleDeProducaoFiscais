import 'package:flutter/material.dart';
import 'package:visa_arapiraca_app/presentation/widgets/ParecerSanitario/Componentes/stack_container.dart';
class AnaliseTecnicaParecer extends StatelessWidget {
  final String analiseTecnica;
  const AnaliseTecnicaParecer({
    super.key,
    required this.analiseTecnica
  });

  @override
  Widget build(BuildContext context) {
    return StackContainer(
      title: "Análise Técnica",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            analiseTecnica,
            style: TextStyle(fontSize: 14),
            textAlign: TextAlign.justify,
          ),
          
          
        ],
      ),
    );
  }
}