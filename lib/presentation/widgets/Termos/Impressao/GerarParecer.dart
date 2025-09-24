import 'dart:typed_data';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:visa_arapiraca_app/data/dtos/ParecerDTO.dart';
import 'package:visa_arapiraca_app/presentation/widgets/termos/Impressao/corpo_parecer.dart';
import 'package:visa_arapiraca_app/presentation/widgets/termos/Impressao/atividades_documento.dart';
import 'package:visa_arapiraca_app/presentation/widgets/termos/Impressao/cabecalho_documento.dart';
import 'package:visa_arapiraca_app/presentation/widgets/termos/Impressao/identificacaoEstabelecimento_documento.dart';
import 'package:visa_arapiraca_app/presentation/widgets/termos/Impressao/load_image.dart';
import 'package:visa_arapiraca_app/presentation/widgets/termos/Impressao/rodape_parecer.dart';

Future<Uint8List> generateDocument(ParecerDTO parecerSanitario) async {

  final logoPrefeitura = await loadImage('assets/logo-prefeitura.png');
  final logoSecretaria = await loadImage('assets/logo-secretariasaude.png');
  final visaLogo = await loadImage('assets/VisaLogo.png');
  
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
              PWCabecalhoParecer(titulo: "Parecer Sanitário", logoPrefeitura: logoPrefeitura, logoSecretaria: logoSecretaria, visaLogo: visaLogo),
              pw.SizedBox(height: 20),
              PWIdentificacaoEstabelecimentoParecer(
                estabelecimento: parecerSanitario.estabelecimento,
                endereco: parecerSanitario.endereco
              ),
              pw.SizedBox(height: 20),
              PWAtividadesParecer(
                atividadePrincipal: {parecerSanitario.cnae.codigo : parecerSanitario.cnae.descricao },
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
