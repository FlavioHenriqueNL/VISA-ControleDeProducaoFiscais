import 'package:flutter/material.dart';
import 'package:visa_arapiraca_app/responsive/desktop_scaffold.dart';
import 'package:visa_arapiraca_app/responsive/mobile_scaffold.dart';
import 'package:visa_arapiraca_app/responsive/responsive.dart';
import 'package:visa_arapiraca_app/responsive/tablet_scaffold.dart';

class Dashboard extends StatefulWidget {
  final Widget content;
  const Dashboard({
    required this.content,
    super.key
  });

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  
  

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: const MobileScaffold(),
      tablet: const TabletScaffold(),
      desktop: DesktopScaffold(content: widget.content),
    );
  }
}
