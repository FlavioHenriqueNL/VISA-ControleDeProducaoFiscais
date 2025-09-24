// presentation/widgets/termos/Impressao/pw_cabecalho_parecer.dart
import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PWCabecalhoParecer extends pw.StatelessWidget {
  final String? titulo;
  final Uint8List logoPrefeitura;
  final Uint8List logoSecretaria;
  final Uint8List visaLogo;

  PWCabecalhoParecer({
    this.titulo,
    required this.logoPrefeitura,
    required this.logoSecretaria,
    required this.visaLogo,
  });

  @override
  pw.Widget build(pw.Context context) {
    return pw.Container(
      decoration: pw.BoxDecoration(
        border: pw.Border(
          bottom: pw.BorderSide(color: PdfColors.amber, width: 2),
        ),
      ),
      padding: const pw.EdgeInsets.symmetric(vertical: 20.0),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
        crossAxisAlignment: pw.CrossAxisAlignment.center,
        children: [
          // Logos lado a lado com separador
          pw.Row(
            children: [
              pw.Image(pw.MemoryImage(logoPrefeitura), width: 175/2),
              pw.Container(
                width: 2,
                height: 75/2,
                color: PdfColors.grey,
                margin: const pw.EdgeInsets.symmetric(horizontal: 25/2),
              ),
              pw.Image(pw.MemoryImage(logoSecretaria), width: 125/2),
            ],
          ),

          // Título central
          pw.Text(
            (titulo ?? "Parecer Sanitário").toUpperCase(),
            style: pw.TextStyle(
              fontSize: 32/1.7,
              fontWeight: pw.FontWeight.bold,
            ),
          ),

          // Logo direita
          pw.Image(pw.MemoryImage(visaLogo), width: 200/2),
        ],
      ),
    );
  }
}
