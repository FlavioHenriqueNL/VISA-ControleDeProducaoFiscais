import 'package:flutter/material.dart';
import 'package:visa_arapiraca_app/data/dtos/ParecerDTO.dart';
import 'package:visa_arapiraca_app/data/dtos/TermoInspecaoDTO.dart';
import 'package:visa_arapiraca_app/domain/entities/parecersanitario.dart';
import 'package:visa_arapiraca_app/presentation/widgets/termos/CriarParecerWidget.dart';
import 'package:visa_arapiraca_app/presentation/widgets/termos/Preview/visualizar_ParecerSanitario.dart';
import 'package:visa_arapiraca_app/presentation/widgets/termos/Preview/visualizar_TermoInspecao.dart';
import 'package:visa_arapiraca_app/presentation/widgets/Termos/CriarTermoInspecaoWidget.dart';
import 'package:visa_arapiraca_app/presentation/widgets/Componentes/scrollable_page.dart';

class TermoInspecaoPage extends StatefulWidget {
  const TermoInspecaoPage({super.key});

  @override
  State<TermoInspecaoPage> createState() => _TermoInspecaoPageState();
}

class _TermoInspecaoPageState extends State<TermoInspecaoPage> {
  @override
  Widget build(BuildContext context) {
    return ScrollablePage(
      child: Container(
        padding: EdgeInsets.all(26),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ListTile(
                    contentPadding: EdgeInsets.all(0),
                    leading: Icon(
                      Icons.description,
                      size: 60,
                      color: Colors.blue,
                    ),
                    title: Text(
                      'Termo de inspeção',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      'Termos e Pareceres',
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    ),
                  ),
                ),

                ElevatedButton.icon(
                  // ignore: avoid_print
                  onPressed: () async {
                    final TermoInspecaoDTO novoTermo = await showDialog(
                      context: context,
                      builder: (context) => CriarTermoinspecaoWidget(),
                    );

                    print(novoTermo);

                    if (novoTermo != null) {
                      print(
                        "Novo parecer criado: ${novoTermo.estabelecimento.numeroAlvara} - ${novoTermo.estabelecimento.cpfCnpj}",
                      );
                    }

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PreviewTermoInspecao(termoInspecao: novoTermo)
                      ),
                    );
                  },
                  icon: Icon(Icons.add_box_outlined, color: Colors.white),
                  label: Text('Adicionar Parecer'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                ),
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
