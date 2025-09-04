import 'package:flutter/material.dart';
import 'package:visa_arapiraca_app/presentation/widgets/ParecerSanitario/Componentes/titulo_secao_pareceres.dart';

class StackContainer extends StatefulWidget {
  final String title;
  final Widget child;

  const StackContainer({required this.title, required this.child, super.key});

  @override
  State<StackContainer> createState() => _StackContainerState();
}

class _StackContainerState extends State<StackContainer> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1.0),
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(16),
          child: widget.child,
        ),
        TituloSecaoPareceres(title: widget.title),
      ],
    );
  }
}
