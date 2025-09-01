import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MenuLateral extends StatelessWidget {
  const MenuLateral({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            DrawerHeader(child: Image.asset("assets/VisaLogo.png")),
            ListTile(
              onTap: () => context.go('/dashboard'),
              leading: Icon(Icons.home),
              title: Text("Dashboard"),
            ),
            ListTile(
              onTap: () => context.go('/termos'),
              leading: Icon(Icons.description),
              title: Text("Termos e Pareceres"),
            ),
            ListTile(
              onTap: () => context.go('/producao'),
              leading: Icon(Icons.bar_chart),
              title: Text("Produção"),
            ),
            ListTile(
              onTap: () => context.go('/estabelecimentos'),
              leading: Icon(Icons.business),
              title: Text("Estabelecimentos"),
            ),
            ListTile(
              onTap: () => context.go('/notificacoes'),
              leading: Icon(Icons.list),
              title: Text("Lista de Notificações"),
            ),
            ListTile(
              onTap: () => context.go('/lista-cnaes'),
              leading: Icon(Icons.list_alt),
              title: Text("Lista de CNAES"),
            ),
          ],
        ),
      ),
    );
  }
}
