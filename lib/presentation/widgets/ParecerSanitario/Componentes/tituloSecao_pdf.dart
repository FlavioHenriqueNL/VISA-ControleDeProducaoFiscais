import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PWTituloSecaoPareceres extends pw.StatelessWidget {
  final String title;
  PWTituloSecaoPareceres({required this.title});

  @override
  pw.Widget build(pw.Context context) {
    return pw.Positioned(
      left: 20,
      top: -12, // pode ajustar para alinhar melhor
      child: pw.Container(
        color: PdfColors.white,
        padding: const pw.EdgeInsets.symmetric(horizontal: 8),
        child: pw.Text(
          title,
          style: pw.TextStyle(
            fontSize: 14,
            color: PdfColors.grey700,
            fontWeight: pw.FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
