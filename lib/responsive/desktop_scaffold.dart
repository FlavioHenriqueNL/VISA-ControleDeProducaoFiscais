import 'package:flutter/material.dart';
import 'package:visa_arapiraca_app/widgets/MenuLateral/menu_lateral.dart';
import 'package:visa_arapiraca_app/widgets/visa_app_bar.dart';

class DesktopScaffold extends StatefulWidget {
  final Widget Function() pageWidget;
  const DesktopScaffold({super.key, required this.pageWidget});

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
            Expanded(flex: 1, child: MenuLateral()),
            Expanded(
              flex: 5,
              child: Column(
                children: [
                  VisaAppBar(title: "VISA Arapiraca"),
                  widget.pageWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
