import 'package:flutter/material.dart';
import 'package:visa_arapiraca_app/presentation/widgets/Termos/ParecerSanitario/Componentes/titulo_secao_pareceres.dart';

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
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Atividade Principal"),
                Text(
                  "${widget.atividadePrincipal.entries.first.key} - ${widget.atividadePrincipal.entries.first.value}",
                ),
                SizedBox(height: 15),
                Text("Atividades Secundárias"),
                if (widget.atividadesSecundarias?.isNotEmpty ?? false)
                  ...widget.atividadesSecundarias!.map((item) {
                    var entry = item.entries.first;
                    return Text("${entry.key} - ${entry.value}");
                  }),
              ],
            ),
          ),
          TituloSecaoPareceres(title: "Atividades do Estabelecimento"),
        ],
      ),
    );
  }
}
