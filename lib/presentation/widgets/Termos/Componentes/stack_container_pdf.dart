import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:visa_arapiraca_app/presentation/widgets/termos/Componentes/tituloSecao_pdf.dart';

class PWStackContainer extends pw.StatelessWidget {
  final String title;
  final pw.Widget child;

  PWStackContainer({required this.title, required this.child});

  @override
  pw.Widget build(pw.Context context) {
    return pw.Stack(
      children: [
        pw.Container(
          width: double.infinity,
          decoration: pw.BoxDecoration(
            border: pw.Border.all(color: PdfColors.grey, width: 1.0),
            borderRadius: pw.BorderRadius.circular(8),
          ),
          padding: const pw.EdgeInsets.all(15),
          child: child,
        ),
        pw.Positioned(
          left: 3.5,
          top: -2, // pode ajustar para alinhar melhor
          child: pw.Container(
            color: PdfColors.white,
            padding: const pw.EdgeInsets.symmetric(horizontal: 8),
            child: pw.Text(
              title,
              style: pw.TextStyle(
                fontSize: 8,
                color: PdfColors.grey700,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
          ),
        )
      ],
    );
  }
}

