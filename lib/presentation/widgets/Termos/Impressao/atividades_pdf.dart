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
          pw.Text(
            "Atividade Principal",
            style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 12),
          ),
          pw.Text(
            "${atividadePrincipal.entries.first.key} - ${atividadePrincipal.entries.first.value}",
            style: pw.TextStyle(fontSize: 10),
          ),
          pw.SizedBox(height: 10),
          pw.Text(
            "Atividades Secundárias",
            style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 12),
          ),
          if (atividadesSecundarias?.isNotEmpty ?? false)
            ...atividadesSecundarias!.map((item) {
              var entry = item.entries.first;
              return pw.Text(
                "${entry.key} - ${entry.value}",
                style: pw.TextStyle(
                  fontWeight: pw.FontWeight.bold,
                  fontSize: 10,
                ),
              );
            }),
        ],
      ),
    );
  }
}
