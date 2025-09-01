import 'package:flutter/material.dart';
import 'package:visa_arapiraca_app/presentation/widgets/scrollable_page.dart';

class TermosPage extends StatefulWidget {
  const TermosPage({super.key});

  @override
  State<TermosPage> createState() => _TermosPageState();
}

class _TermosPageState extends State<TermosPage> {
  @override
  Widget build(BuildContext context) {
    return ScrollablePage(
      child: Container(
        padding: const EdgeInsets.all(25.0),
        color: Colors.white,
        child: Column(children: [Text("Termos e Pareceres Sanitários")]),
      ),
    );
  }
}
