import 'package:flutter/material.dart';
import 'package:visa_arapiraca_app/widgets/MenuLateral/menu_lateral.dart';

class DesktopScaffold extends StatefulWidget {
  const DesktopScaffold({super.key});

  @override
  State<DesktopScaffold> createState() => _DesktopScaffoldState();
}

class _DesktopScaffoldState extends State<DesktopScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: MenuLateral()
            ),  
            Expanded(
              flex: 5,
              child: Container(
                  color: Colors.grey[300],
              )
            )
          ],
        )
      ),
    );
  }
}