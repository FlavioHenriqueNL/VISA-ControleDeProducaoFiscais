import 'package:flutter/material.dart';

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
              child: Column(
                children: [
                  DrawerHeader(child: Image.asset("assets/VisaLogo.png")),
                  ListTile(onTap: (){}, leading: Icon(Icons.home), title: Text("Dashboard"),),
                  ListTile(onTap: (){}, leading: Icon(Icons.home), title: Text("Produção"),),
                  ListTile(onTap: (){}, leading: Icon(Icons.home), title: Text("Estabelecimentos"),),
                  ListTile(onTap: (){}, leading: Icon(Icons.home), title: Text("Lista de Notificações"),),
                  ListTile(onTap: (){}, leading: Icon(Icons.home), title: Text("Lista de CNAES"),)
                ],
              )
              ),  
            Expanded(
              flex: 5,
              child: Container(
                  color: Colors.grey[100],
              )
            )
          ],
        )
      ),
    );
  }
}