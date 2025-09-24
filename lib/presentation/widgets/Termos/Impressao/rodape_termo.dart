import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:visa_arapiraca_app/presentation/widgets/termos/Componentes/stack_container_pdf.dart';

class PWAssinaturasTermo extends pw.StatelessWidget {
  final String fiscalResponsavel;
  final String matriculaFiscal;

   PWAssinaturasTermo({
    required this.fiscalResponsavel,
    required this.matriculaFiscal,
    
  });

  @override
  pw.Widget build(pw.Context context) {
    return PWStackContainer(title: "Ciência", 
      child: pw.Column(
        children: [
         pw.Row(
           // faz os filhos "esticarem"
          children: [
            pw.Expanded(
              child: pw.Column(
                children: [
                  pw.SizedBox(height: 20),
                  pw.Divider(),
                  pw.Text("Responsável Técnico e/ou Legal"),
                  pw.SizedBox(height: 25),
                  pw.Divider(),
                  pw.Text("Testemunha"),
                  pw.SizedBox(height: 25),
                  pw.Divider(),
                  pw.Text("Testemunha"),
                ],
              ),
            ),

            pw.Container(
              width: 1,
              color: PdfColors.yellow400,
              margin: const pw.EdgeInsets.symmetric(horizontal: 10),
            ),

            pw.Expanded(
              child: pw.Column(
                children: [
                  pw.SizedBox(height: 20),
                  pw.Divider(),
                  pw.Text(fiscalResponsavel),
                  pw.Text("Matricula nº: $matriculaFiscal"),
                  pw.Text("Fiscal Sanitário Responsável"),
                  pw.SizedBox(height: 25),
                  pw.Divider(),
                  pw.Text("Fiscal Sanitário"),
                  pw.SizedBox(height: 25),
                  pw.Divider(),
                  pw.Text("Fiscal Sanitário"),
                ],
              ),
            ),
            ],
          )
        ],
      ),
    );
  }
}