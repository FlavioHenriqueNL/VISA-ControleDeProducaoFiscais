import 'package:intl/intl.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:visa_arapiraca_app/domain/entities/parecersanitario.dart';
import 'package:visa_arapiraca_app/presentation/widgets/ParecerSanitario/Componentes/identificacaoField_pdf.dart';

class PWRodapeParecer extends pw.StatelessWidget {
  final ParecerSanitario parecerSanitario;
  PWRodapeParecer({required this.parecerSanitario});

  @override
  pw.Widget build(pw.Context context) {
    return pw.Column(
      children: [
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.center,
          children: [
            PWIdentificacaoField(
              field: "Taxa do Alvará:",
              value: "R\$ ${parecerSanitario.taxa})}",
            ),
            pw.SizedBox(width: 100),
            PWIdentificacaoField(
              field: "Validade:",
              value: parecerSanitario.validade,
            ),
          ],
        ),
        pw.SizedBox(height: 50),
        pw.Text(
          "Arapiraca, ${DateTime.now().day} de ${DateFormat('MMMM', 'pt_BR').format(DateTime.now())} de ${DateTime.now().year}",
          style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold),
        ),
        pw.SizedBox(height: 10),
        pw.Text(
          "Flávio Henrique Nunes Leite - Fiscal Sanitário Municipal Mat. 107363",
          style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold),
        ),
        pw.Text(
          'Este é um documento emitido eletronicamente e válido sem assinatura.',
          style: pw.TextStyle(fontSize: 10, fontStyle: pw.FontStyle.italic),
          textAlign: pw.TextAlign.center,
        ),
        pw.SizedBox(height: 10),
      ],
    );
  }
}
