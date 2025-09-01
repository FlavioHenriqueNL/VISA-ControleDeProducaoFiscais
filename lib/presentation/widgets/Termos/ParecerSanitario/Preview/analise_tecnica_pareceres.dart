import 'package:flutter/material.dart';
import 'package:visa_arapiraca_app/presentation/widgets/Termos/ParecerSanitario/Componentes/titulo_secao_pareceres.dart';

class AnaliseTecnicaParecer extends StatelessWidget {
  const AnaliseTecnicaParecer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 25, vertical: 10),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1.0),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(16),
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
          ),
          TituloSecaoPareceres(title: "Análise Técnica"),
        ],
      ),
    );
  }
}