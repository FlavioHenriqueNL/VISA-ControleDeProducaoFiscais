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
  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobile: MobileScaffold(),
      tablet: TabletScaffold(),
      desktop: DesktopScaffold(),
    );
  }
}