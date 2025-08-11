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
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1),
      ),
      padding: EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Atividade Principal"),
          Text(
            "${widget.atividadePrincipal.entries.first.key} - ${widget.atividadePrincipal.entries.first.value}",
          ),
          SizedBox(height: 25),
          Text("Atividades Secundárias"),
          if (widget.atividadesSecundarias?.isNotEmpty ?? false)
            ...widget.atividadesSecundarias!.map((item) {
              var entry = item.entries.first;
              return Text("${entry.key} - ${entry.value}");
            }),
          Text(
            "${widget.atividadePrincipal.entries.first.key} - ${widget.atividadePrincipal.entries.first.value}",
          ),
        ],
      ),
    );
  }
}
