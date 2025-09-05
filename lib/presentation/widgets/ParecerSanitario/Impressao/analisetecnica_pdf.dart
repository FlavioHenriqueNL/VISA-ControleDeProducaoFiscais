import 'package:pdf/widgets.dart' as pw;
import 'package:visa_arapiraca_app/presentation/widgets/ParecerSanitario/Componentes/stack_container_pdf.dart';

class PWAnaliseTecnicaParecer extends pw.StatelessWidget {
  final String analiseTecnica;
  PWAnaliseTecnicaParecer({required this.analiseTecnica});

  @override
  pw.Widget build(pw.Context context) {
    return PWStackContainer(
      title: "Análise Técnica",
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(
            analiseTecnica,
            style: pw.TextStyle(fontSize: 14),
            textAlign: pw.TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
