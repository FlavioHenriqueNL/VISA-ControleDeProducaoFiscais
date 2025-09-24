import 'package:flutter/material.dart';

class CabecalhoDocumento extends StatelessWidget {
  final String? titulo;

  const CabecalhoDocumento({this.titulo, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.amber, width: 2)),
      ),
      padding: EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Image.asset("assets/logo-prefeitura.png", width: 175),
               Container(
                width: 2, // espessura da borda
                height: 75, // altura da linha (ajuste conforme necessidade)
                color: Colors.grey, // cor da linha
                margin: EdgeInsets.symmetric(horizontal: 25), // espaço em volta da linha
              ),
              Image.asset("assets/logo-secretariasaude.png", width: 125,)
            ],
          ),
          Text(
            titulo?.toUpperCase() ?? "Parecer Sanitário".toUpperCase(),
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          Image.asset("assets/VisaLogo.png", width: 200),
        ],
      ),
    );
  }
}
