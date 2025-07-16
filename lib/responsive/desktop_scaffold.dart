import 'package:flutter/material.dart';
import 'package:visa_arapiraca_app/widgets/MenuLateral/menu_lateral.dart';
import 'package:visa_arapiraca_app/widgets/visa_app_bar.dart';

class DesktopScaffold extends StatefulWidget {
  final PageController controller;
  final void Function(int) onPageSelected;
  final List<Widget> pages;

  const DesktopScaffold({
    super.key,
    required this.controller,
    required this.onPageSelected,
    required this.pages,
  });

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
              child: MenuLateral(onItemSelected: widget.onPageSelected),
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
                        child: PageView(
                          controller: widget.controller,
                          physics: const NeverScrollableScrollPhysics(),
                          children: widget.pages,
                        ),
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
