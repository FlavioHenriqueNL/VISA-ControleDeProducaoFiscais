import 'package:flutter/material.dart';
import 'package:visa_arapiraca_app/pages/cnaes/cnaes.dart';
import 'package:visa_arapiraca_app/pages/home/home.dart';
import 'package:visa_arapiraca_app/pages/producao/producao_diaria.dart';
import 'package:visa_arapiraca_app/responsive/desktop_scaffold.dart';
import 'package:visa_arapiraca_app/responsive/mobile_scaffold.dart';
import 'package:visa_arapiraca_app/responsive/responsive.dart';
import 'package:visa_arapiraca_app/responsive/tablet_scaffold.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  //Para o controle de páginas
  late final PageController _pageController;
  int _currentPage = 0;

  final List<Widget> _pagesList = const [
    Home(),
    ProducaoDiaria(),
    Center(child: Text('Página 3')),
    Center(child: Text('Página 4')),
    CnaesPage(),
  ];
  
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  void _onPageSelected (int index) {
    setState(() {
      _currentPage = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: const MobileScaffold(),
      tablet: const TabletScaffold(),
      desktop: DesktopScaffold(
        controller: _pageController,
        onPageSelected: _onPageSelected,
        pages: _pagesList
      ),
    );
  }
}
