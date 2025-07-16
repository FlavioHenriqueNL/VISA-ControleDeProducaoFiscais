import 'package:flutter/material.dart';

class MenuLateral extends StatelessWidget {
  final void Function(int) onItemSelected;
  const MenuLateral({
    required this.onItemSelected,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: SingleChildScrollView(
        child: Column(
          children: [
            DrawerHeader(child: Image.asset("assets/VisaLogo.png")),
            ListTile(onTap: ()=> onItemSelected.call(0), leading: Icon(Icons.home), title: Text("Dashboard"),),
            ListTile(onTap: ()=> onItemSelected.call(1), leading: Icon(Icons.bar_chart), title: Text("Produção"),),
            ListTile(onTap: ()=> onItemSelected.call(2), leading: Icon(Icons.business), title: Text("Estabelecimentos"),),
            ListTile(onTap: ()=> onItemSelected.call(3), leading: Icon(Icons.list), title: Text("Lista de Notificações"),),
            ListTile(onTap: ()=> onItemSelected.call(4), leading: Icon(Icons.list_alt), title: Text("Lista de CNAES"),),
          ],
        )
      ),
    );
  }
}