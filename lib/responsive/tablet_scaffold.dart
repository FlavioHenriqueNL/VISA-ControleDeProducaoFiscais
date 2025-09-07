import 'package:flutter/material.dart';
import 'package:visa_arapiraca_app/presentation/widgets/MenuLateral/menu_lateral.dart';
import 'package:visa_arapiraca_app/presentation/widgets/visa_app_bar.dart';

class TabletScaffold extends StatefulWidget {
  final Widget content; // Recebe o conteúdo da rota filha

  const TabletScaffold({super.key, required this.content});

  @override
  State<TabletScaffold> createState() => _TabletScaffoldState();
}

class _TabletScaffoldState extends State<TabletScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: MenuLateral(
                key: Key('menu_lateral'),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                color: Colors.grey[300],
                child: Column(
                  children: [
                    VisaAppBar(title: "VISA Arapiraca"),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(15.0),
                        child: widget.content, // Renderiza o conteúdo da rota filha
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}