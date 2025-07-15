import 'package:flutter/material.dart';
import 'package:visa_arapiraca_app/responsive/desktop_scaffold.dart';
import 'package:visa_arapiraca_app/responsive/mobile_scaffold.dart';
import 'package:visa_arapiraca_app/responsive/responsive.dart';
import 'package:visa_arapiraca_app/responsive/tablet_scaffold.dart';

class TesteResponsivo extends StatefulWidget {
  const TesteResponsivo({super.key});

  @override
  State<TesteResponsivo> createState() => _TesteResponsivoState();
}

class _TesteResponsivoState extends State<TesteResponsivo> {
  Widget pageWidgets() {
    return SafeArea(
      child: Row(
        children: [
          if (ResponsiveLayout.isMobile(context)) Text("Texto em Mobile"),
          if (ResponsiveLayout.isDesktop(context)) Text("Texto em Desktop"),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: const MobileScaffold(),
      tablet: const TabletScaffold(),
      desktop: DesktopScaffold(pageWidget: pageWidgets),
    );
  }
}
