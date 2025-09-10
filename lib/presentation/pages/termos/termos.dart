import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:visa_arapiraca_app/presentation/widgets/Componentes/scrollable_page.dart';

class TermosPage extends StatefulWidget {
  const TermosPage({super.key});

  @override
  State<TermosPage> createState() => _TermosPageState();
}

final List<List<String>> termosLista = [
  ['Parecer Sanitário', 'parecer-sanitario'],
  ['Termo de Inspeção', 'termo-inspecao'],
  ['Notificação', 'notificacao'],
  ['Auto de Infração', 'auto-infracao'],
  ['Termo de Apreensão', 'termo-apreensao'],
  ['Interdição', 'interdicao'],
];

class _TermosPageState extends State<TermosPage> {
  @override
  Widget build(BuildContext context) {
    return ScrollablePage(
      child: Container(
        padding: const EdgeInsets.all(25.0),
        color: Colors.white,
        child: Column(
          children: [
            const Text(
              "Termos e Pareceres",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 12, // espaço horizontal entre os cards
              runSpacing: 12, // espaço vertical entre as linhas
              children: termosLista.map((termo) {
                return ElevatedButton(
                  style: botaoTermos,
                  onPressed: () {
                    context.go('/termos/${termo[1]}');
                  },
                  child: Text(termo[0], textAlign: TextAlign.center),
                );
              }).toList(),
            ),
          ],
        ),
      ),
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
