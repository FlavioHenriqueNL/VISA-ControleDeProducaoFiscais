import 'package:flutter/material.dart';
import 'package:visa_arapiraca_app/data/dtos/TermoNotificacaoDTO.dart';
import 'package:visa_arapiraca_app/presentation/widgets/componentes/dashboard_body.dart';
import 'package:visa_arapiraca_app/presentation/widgets/componentes/page_title.dart';
import 'package:visa_arapiraca_app/presentation/widgets/termos/Componentes/criar_button.dart';
import 'package:visa_arapiraca_app/presentation/widgets/termos/Preview/visualizar_TermoInspecao.dart';
import 'package:visa_arapiraca_app/presentation/widgets/Termos/CriarTermoInspecaoWidget.dart';
import 'package:visa_arapiraca_app/presentation/widgets/Componentes/scrollable_page.dart';
import 'package:visa_arapiraca_app/presentation/widgets/termos/Preview/visualizar_TermoNotificacao.dart';
import 'package:visa_arapiraca_app/presentation/widgets/termos/termoNotificacao_criar.dart';

class TermoNotificacaoPage extends StatefulWidget {
  const TermoNotificacaoPage({super.key});

  @override
  State<TermoNotificacaoPage> createState() => _TermoNotificacaoPageState();
}

class _TermoNotificacaoPageState extends State<TermoNotificacaoPage> {

  Future<void> criarTermo () async{
    final TermoNotificacaoDTO novoTermo = await showDialog(
      context: context,
      builder: (context) => CriarTermoNotificacaoWidget(),
    );

    if (novoTermo != null) {
      print(
        "Novo parecer criado: ${novoTermo.estabelecimento.numeroAlvara} - ${novoTermo.estabelecimento.cpfCnpj}",
      );
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PreviewTermoNotificacao(termoNotificacao: novoTermo)
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return ScrollablePage(
      child: DashboardBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: PageTitle(icon: Icons.description, title: "Termo de Notificação", subtitle: "Termos e Pareceres"),),
                ButtonCriarTermo(label: "Notificar Estabelecimento", onPressedAction: () => criarTermo())
              ],
            ),

            SizedBox(height: 60),
            Center(
              child: Text(
                "Seção de estatísticas e gráficos (em desenvolvimento)...",
              ),
            ),
            SizedBox(height: 60),

            Text(
              "Suas últimas Inspeções",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              "Gerencie e visualize os termos de inspeção emitidos recentemente.",
              style: TextStyle(fontSize: 16, color: Colors.grey[800]),
            ),
            SizedBox(height: 30),
            Text(
              "Lista de Inspeções (em desenvolvimento)...",
              style: TextStyle(fontSize: 16, color: Colors.grey[800]),
            ),
          ],
        )
      )
    );
  }
}

