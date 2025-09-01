import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:visa_arapiraca_app/widgets/MenuLateral/menu_lateral.dart';
import 'package:visa_arapiraca_app/widgets/visa_app_bar.dart';

class DesktopScaffold extends StatelessWidget {
  final Widget content; // Recebe o conteúdo da rota filha

  const DesktopScaffold({super.key, required this.content});

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
                        child: content, // Renderiza o conteúdo da rota filha
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
