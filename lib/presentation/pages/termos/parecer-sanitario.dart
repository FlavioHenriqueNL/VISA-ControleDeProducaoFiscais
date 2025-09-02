import 'package:flutter/material.dart';
import 'package:visa_arapiraca_app/presentation/widgets/ParecerSanitario/CriarParecerWidget.dart';
import 'package:visa_arapiraca_app/presentation/widgets/scrollable_page.dart';

class ParecerSanitarioPage extends StatefulWidget {
  const ParecerSanitarioPage({super.key});

  @override
  State<ParecerSanitarioPage> createState() => _ParecerSanitarioPageState();
}

class _ParecerSanitarioPageState extends State<ParecerSanitarioPage> {
  @override
  Widget build(BuildContext context) {
    return  ScrollablePage(
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
                    leading: Icon(Icons.description, size: 60, color: Colors.blue),
                    title: Text(
                      'Termos e Pareceres',
                      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'Parecer Sanitário',
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    ),
                  ),
                ),
                
                CriarParecerSanitarioButton()
              ],
            ),
           
            SizedBox(height: 60),
            Center(child: Text("Seção de estatísticas e gráficos (em desenvolvimento)...")),
            SizedBox(height: 60),

            Text("Seus últimos pareceres",style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text("Gerencie e visualize os pareceres emitidos recentemente.",style: TextStyle(fontSize: 16, color: Colors.grey[800])),
            SizedBox(height: 30),
            Text("Lista de pareceres (em desenvolvimento)...",style: TextStyle(fontSize: 16, color: Colors.grey[800])),


           
          ],
        ),
      ),
    );
  }
}