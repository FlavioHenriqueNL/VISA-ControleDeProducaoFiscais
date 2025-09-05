import 'package:flutter/material.dart';
import 'package:visa_arapiraca_app/presentation/widgets/ParecerSanitario/Componentes/stack_container.dart';
class AnaliseTecnicaParecer extends StatelessWidget {
  const AnaliseTecnicaParecer({super.key});

  @override
  Widget build(BuildContext context) {
    return StackContainer(
      title: "Análise Técnica",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Loren ipsum dolor sit amet, consectetur adipiscing elit. Lorem*3 ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
            style: TextStyle(fontSize: 14),
            textAlign: TextAlign.justify,
          ),
          Text(
            "Loren ipsum dolor sit amet, consectetur adipiscing elit. Lorem*3 ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
            style: TextStyle(fontSize: 14),
            textAlign: TextAlign.justify,
          ),
          Text(
            "Loren ipsum dolor sit amet, consectetur adipiscing elit. Lorem*3 ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
            style: TextStyle(fontSize: 14),
            textAlign: TextAlign.justify,
          ),
          Text(
            "Loren ipsum dolor sit amet, consectetur adipiscing elit. Lorem*3 ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
            style: TextStyle(fontSize: 14),
            textAlign: TextAlign.justify,
          ),
          Text(
            "Loren ipsum dolor sit amet, consectetur adipiscing elit. Lorem*3 ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
            style: TextStyle(fontSize: 14),
            textAlign: TextAlign.justify,
          ),
          
        ],
      ),
    );
  }
}