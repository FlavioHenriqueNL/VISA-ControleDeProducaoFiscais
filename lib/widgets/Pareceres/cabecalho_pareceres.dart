import 'package:flutter/material.dart';

class CabecalhoParecer extends StatelessWidget {
  final String? titulo;

  const CabecalhoParecer({this.titulo, super.key});

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
          Image.asset("assets/VisaLogo.png", width: 250),
          Text(
            titulo?.toUpperCase() ?? "Parecer Sanitário".toUpperCase(),
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          Image.asset("assets/VisaLogo.png", width: 250),
        ],
      ),
    );
  }
}
