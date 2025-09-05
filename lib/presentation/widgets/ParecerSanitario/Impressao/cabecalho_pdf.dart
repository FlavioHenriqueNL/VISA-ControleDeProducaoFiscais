import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:visa_arapiraca_app/presentation/widgets/ParecerSanitario/Impressao/loadImage.dart';

class PWCabecalhoParecer extends pw.StatelessWidget {
  final String? titulo;
  PWCabecalhoParecer({this.titulo});

  @override
  pw.Widget build(pw.Context context) {
    return pw.Container(
      decoration: pw.BoxDecoration(
        border: pw.Border(
          bottom: pw.BorderSide(color: PdfColors.amber, width: 2),
        ),
      ),
      padding: pw.EdgeInsets.symmetric(vertical: 20.0),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
        children: [
          //pw.Image.asset("assets/VisaLogo.png", width: 250),
          pw.Text(
            titulo?.toUpperCase() ?? "Parecer Sanitário".toUpperCase(),
            style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold),
          ),
          // Image.asset("assets/VisaLogo.png", width: 250),
        ],
      ),
    );
  }
}
