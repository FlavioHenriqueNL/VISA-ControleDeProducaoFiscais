import 'dart:typed_data';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:visa_arapiraca_app/data/dtos/TermoInspecaoDTO.dart';
import 'package:visa_arapiraca_app/presentation/widgets/termos/Impressao/cabecalho_pdf.dart';
import 'package:visa_arapiraca_app/presentation/widgets/termos/Impressao/identificacaoEstabelecimento_pdf.dart';
import 'package:visa_arapiraca_app/presentation/widgets/termos/Impressao/atividades_pdf.dart';
import 'package:visa_arapiraca_app/presentation/widgets/termos/Impressao/info_termoInspecao_pdf.dart';
import 'package:visa_arapiraca_app/presentation/widgets/termos/Impressao/load_image.dart';
import 'package:visa_arapiraca_app/presentation/widgets/termos/Impressao/rodape_Termos_pdf.dart';


Future<Uint8List> generateDocument(TermoInspecaoDTO termoInspecao) async {

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
              PWCabecalhoParecer(titulo: "Termo de Inspeção", logoPrefeitura: logoPrefeitura, logoSecretaria: logoSecretaria, visaLogo: visaLogo),
              pw.SizedBox(height: 10),
              PWIdentificacaoEstabelecimentoParecer(
                estabelecimento: termoInspecao.estabelecimento,
                endereco: termoInspecao.endereco
              ),
              pw.SizedBox(height: 10),
              PWAtividadesParecer(
                atividadePrincipal: {termoInspecao.cnae.codigo : termoInspecao.cnae.descricao},
              ),
              pw.SizedBox(height: 12),
              PWInfoTermoInspecao(termo: termoInspecao.termoInspecao),
              pw.SizedBox(height: 10),
              PWAssinaturasTermo(
                fiscalResponsavel: termoInspecao.termoInspecao.fiscalResponsavel, 
                matriculaFiscal: termoInspecao.termoInspecao.matriculaFiscal
              )
            ],
          ),
        );
      },
    ),
  );

  return pdf.save();
}
