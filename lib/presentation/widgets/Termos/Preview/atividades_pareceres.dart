import 'package:flutter/material.dart';
import 'package:visa_arapiraca_app/presentation/widgets/termos/Componentes/stack_container.dart';

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
    return StackContainer(
      title: "Atividades do Estabelecimento",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
            "Atividade Principal: ",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Text(
            "${widget.atividadePrincipal.entries.first.key} - ${widget.atividadePrincipal.entries.first.value}",
            style: TextStyle(fontSize: 16),
          ),
            ],
          ),


          if (widget.atividadesSecundarias?.isNotEmpty ?? false) 
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 15),
                Text(
                  "Atividades Secundárias",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                ...widget.atividadesSecundarias!.map(
                  (item) => Text(
                    "${item.entries.first.key} - ${item.entries.first.value}",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            )
        ],
      ),
    );
  }
}
