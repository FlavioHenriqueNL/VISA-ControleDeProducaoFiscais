import 'dart:typed_data';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:visa_arapiraca_app/data/dtos/ParecerDTO.dart';
import 'package:visa_arapiraca_app/presentation/widgets/termos/Impressao/analisetecnica_pdf.dart';
import 'package:visa_arapiraca_app/presentation/widgets/termos/Impressao/atividades_pdf.dart';
import 'package:visa_arapiraca_app/presentation/widgets/termos/Impressao/cabecalho_pdf.dart';
import 'package:visa_arapiraca_app/presentation/widgets/termos/Impressao/identificacaoEstabelecimento_pdf.dart';
import 'package:visa_arapiraca_app/presentation/widgets/termos/Impressao/rodape_pdf.dart';

Future<Uint8List> generateDocument(ParecerDTO parecerSanitario) async {
  final pdf = pw.Document();
  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      margin: const pw.EdgeInsets.all(0.0),
      build: (pw.Context context) {
        return pw.Container(
          width: double.infinity,
          padding: const pw.EdgeInsets.all(16),

          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.center,
            children: [
              PWCabecalhoParecer(),
              pw.SizedBox(height: 20),
              PWIdentificacaoEstabelecimentoParecer(
                estabelecimento: parecerSanitario.estabelecimento,
                endereco: parecerSanitario.endereco
              ),
              pw.SizedBox(height: 20),
              PWAtividadesParecer(
                atividadePrincipal: {parecerSanitario.estabelecimento.cnae: ""},
              ),
              pw.SizedBox(height: 20),
              PWAnaliseTecnicaParecer(
                analiseTecnica:
                    parecerSanitario.parecerSanitario.analiseTecnica,
              ),
              pw.SizedBox(height: 50),
              PWRodapeParecer(
                parecerSanitario: parecerSanitario.parecerSanitario,
              ),
            ],
          ),
        );
      },
    ),
  );

  return pdf.save();
}
