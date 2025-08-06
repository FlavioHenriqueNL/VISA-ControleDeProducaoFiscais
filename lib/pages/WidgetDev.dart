import 'package:flutter/material.dart';

class Widgetdev extends StatefulWidget {
  final Map<String, String> atividadePrincipal;
  final List<Map<String, String>>? atividadesSecundarias;

  const Widgetdev({
    super.key,
    required this.atividadePrincipal,
    this.atividadesSecundarias,
  });

  @override
  State<Widgetdev> createState() => _WidgetdevState();
}

class _WidgetdevState extends State<Widgetdev> {
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
