import 'package:flutter/material.dart';
import 'package:visa_arapiraca_app/core/utils/session_helper.dart';
import 'package:visa_arapiraca_app/core/utils/string_utils.dart';
import 'package:visa_arapiraca_app/presentation/widgets/Componentes/scrollable_page.dart';

import '../../widgets/componentes/dashboard_body.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final fiscalInfo = StaticSessionHelper().currentFiscal;

  @override
  Widget build(BuildContext context) {

    return ScrollablePage(
      child: DashboardBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: EdgeInsets.all(0),
              leading: Icon(
                Icons.home,
                size: 60,
                color: Colors.blue,
              ),
              title: Text(
                'Dashboard',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                'Seja bem vindo! ${fiscalInfo?.nome.primeiroNome()}',
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
            ),

            SizedBox(height: 35),
            Text("O programa ainda está em fase de desenvolvimento, logo algumas partes do sistema ainda não operam plenamente."),
            
          ],
        ),
      ),
    );
  }
}