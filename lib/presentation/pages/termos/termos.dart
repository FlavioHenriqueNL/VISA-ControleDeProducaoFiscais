import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:visa_arapiraca_app/presentation/widgets/componentes/dashboard_body.dart';

class TermosPage extends StatefulWidget {
  const TermosPage({super.key});

  @override
  State<TermosPage> createState() => _TermosPageState();
}

final List<List<dynamic>> termosLista = [
  ['Parecer Sanitário', 'parecer-sanitario', Icons.fact_check_sharp],
  ['Termo de Inspeção', 'termo-inspecao', Icons.assignment],
  ['Notificação', 'notificacao', Icons.notifications],
  ['Auto de Infração', 'auto-infracao', Icons.report], 
  ['Termo de Apreensão', 'termo-apreensao', Icons.block],
  ['Interdição', 'interdicao', Icons.inventory_2],
];

class _TermosPageState extends State<TermosPage> {
  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: DashboardBody(
        child: Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.all(0),
              leading: Icon(
                Icons.description,
                size: 60,
                color: Colors.blue,
              ),
              title: Text(
                'Termos e Pareceres',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                "Documentos oficiais VISA de forma ágil e prática.",
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
            ),

            const SizedBox(height: 50),

            LayoutBuilder(
              builder: (context, constraints) {
                const maxItemsPerRow = 3;
                const spacing = 12.0;
                final totalSpacing = spacing * (maxItemsPerRow - 1);
                final buttonWidth = (constraints.maxWidth - totalSpacing) / maxItemsPerRow;

                return Wrap(
                  spacing: spacing,
                  runSpacing: spacing,
                  children: termosLista.map((termo) {
                    return SizedBox(
                      width: buttonWidth,
                      height: 150,
                      child: ElevatedButton.icon(
                        style: botaoTermos,

                        onPressed: () {
                          context.go('/termos/${termo[1]}');
                        },
                        icon: Icon(termo[2], size: 80,),
                        label: Flexible(      // ⚡ importante!
                          child: Text(
                            termo[0],
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 22),
                            softWrap: true,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ],
        ),
      )
    );
  }
}

final ButtonStyle botaoTermos = ElevatedButton.styleFrom(
  backgroundColor: Colors.blue,
  foregroundColor: Colors.white,
  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
  textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
  minimumSize: Size(200, 120),
);


