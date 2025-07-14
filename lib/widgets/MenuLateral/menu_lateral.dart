import 'package:flutter/material.dart';

class MenuLateral extends StatelessWidget {
  const MenuLateral({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            DrawerHeader(child: Image.asset("assets/VisaLogo.png")),
            ListTile(onTap: (){}, leading: Icon(Icons.home), title: Text("Dashboard"),),
            ListTile(onTap: (){}, leading: Icon(Icons.home), title: Text("Produção"),),
            ListTile(onTap: (){}, leading: Icon(Icons.home), title: Text("Estabelecimentos"),),
            ListTile(onTap: (){}, leading: Icon(Icons.home), title: Text("Lista de Notificações"),),
            ListTile(onTap: (){}, leading: Icon(Icons.home), title: Text("Lista de CNAES"),),
            ListTile(onTap: (){}, leading: Icon(Icons.home), title: Text("Outros"),)
          ],
        )
      ),
    );
  }
}