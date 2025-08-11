import 'package:flutter/material.dart';

class AtividadesParecer extends StatefulWidget {
  final Map<String, String> atividadePrincipal;
  final List<Map<String, String>>? atividadesSecundarias;

  const AtividadesParecer({
    super.key,
    required this.atividadePrincipal,
    this.atividadesSecundarias,
  });

  @override
  State<AtividadesParecer> createState() => _AtividadesParecerState();
}

class _AtividadesParecerState extends State<AtividadesParecer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Column(
            children: [
              Text("Atividade Principal"),
              Text(
                "${widget.atividadePrincipal.entries.first.key} - ${widget.atividadePrincipal.entries.first.value}",
              ),
            ],
          ),
          Column(
            children: [
              Text("Atividades Secundárias"),
              if (widget.atividadesSecundarias?.isNotEmpty ?? false)
                ...widget.atividadesSecundarias!.map((item) {
                  var entry = item.entries.first;
                  return Text("${entry.key} - ${entry.value}");
                }),
            ],
          ),
        ],
      ),
    );
  }
}