import 'package:pdf/widgets.dart' as pw;
import 'package:visa_arapiraca_app/presentation/widgets/termos/Componentes/stack_container_pdf.dart';

class PWAtividadesParecer extends pw.StatelessWidget {
  final Map<String, String> atividadePrincipal;
  final List<Map<String, String>>? atividadesSecundarias;
  PWAtividadesParecer({
    required this.atividadePrincipal,
    this.atividadesSecundarias,
  });

  @override
  pw.Widget build(pw.Context context) {
    return PWStackContainer(
      title: "Atividades do Estabelecimento",
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Row(
            children: [
              pw.Text(
                "Atividade Principal",
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 10),
              ),
              pw.SizedBox(width: 5),
              pw.Text(
                "${atividadePrincipal.entries.first.key} - ${atividadePrincipal.entries.first.value}",
                style: pw.TextStyle(fontSize: 10),
              ),
            ]
          ),
         
          if (atividadesSecundarias?.isNotEmpty ?? false) 
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.SizedBox(height: 10),
                pw.Text(
                  "Atividades Secundárias",
                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 12),
                ),
                pw.SizedBox(height: 15),
                pw.Text(
                  "Atividades Secundárias",
                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 18),
                ),
                ...atividadesSecundarias!.map(
                  (item) => pw.Text(
                    "${item.entries.first.key} - ${item.entries.first.value}",
                    style: pw.TextStyle(fontSize: 16),
                  ),
                ),
              ],
            )
        ],
      ),
    );
  }
}
