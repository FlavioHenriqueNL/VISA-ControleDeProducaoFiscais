import 'package:flutter/material.dart';
import 'package:visa_arapiraca_app/data/dtos/ParecerDTO.dart';
import 'package:visa_arapiraca_app/domain/entities/parecersanitario.dart';
import 'package:visa_arapiraca_app/presentation/widgets/componentes/dashboard_body.dart';
import 'package:visa_arapiraca_app/presentation/widgets/componentes/page_title.dart';
import 'package:visa_arapiraca_app/presentation/widgets/termos/Componentes/criar_button.dart';
import 'package:visa_arapiraca_app/presentation/widgets/termos/CriarParecerWidget.dart';
import 'package:visa_arapiraca_app/presentation/widgets/termos/Preview/visualizar_ParecerSanitario.dart';
import 'package:visa_arapiraca_app/presentation/widgets/Componentes/scrollable_page.dart';

class ParecerSanitarioPage extends StatefulWidget {
  const ParecerSanitarioPage({super.key});

  @override
  State<ParecerSanitarioPage> createState() => _ParecerSanitarioPageState();
}

class _ParecerSanitarioPageState extends State<ParecerSanitarioPage> {

  Future<void> criarParecer(BuildContext context) async{
    final ParecerDTO novoParecer = await showDialog(
      context: context,
      builder: (context) => CriarParecerWidget(),
    );

    print(novoParecer);
  
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PreviewParecerSanitario(
          parecerSanitario: novoParecer,
        ),
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
                Expanded(
                  child: PageTitle(
                    icon: Icons.description, 
                    title: "Parecer Sanitário",
                    subtitle: "Termos e Pareceres", 
                   )
                ),

                ButtonCriarTermo(
                  label: "Novo Parecer", 
                  onPressedAction: () { criarParecer(context); }
                )
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
              "Seus últimos pareceres",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              "Gerencie e visualize os pareceres emitidos recentemente.",
              style: TextStyle(fontSize: 16, color: Colors.grey[800]),
            ),
            SizedBox(height: 30),
            Text(
              "Lista de pareceres (em desenvolvimento)...",
              style: TextStyle(fontSize: 16, color: Colors.grey[800]),
            ),
          ],
        ),
      ),
    );
  }
}
