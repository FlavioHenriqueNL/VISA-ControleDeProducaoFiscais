import 'dart:typed_data';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:visa_arapiraca_app/data/dtos/TermoNotificacaoDTO.dart';

import 'package:visa_arapiraca_app/presentation/widgets/termos/Impressao/cabecalho_documento.dart';
import 'package:visa_arapiraca_app/presentation/widgets/termos/Impressao/identificacaoEstabelecimento_documento.dart';
import 'package:visa_arapiraca_app/presentation/widgets/termos/Impressao/atividades_documento.dart';
import 'package:visa_arapiraca_app/presentation/widgets/termos/Impressao/corpo_termoNotificacao.dart';
import 'package:visa_arapiraca_app/presentation/widgets/termos/Impressao/load_image.dart';
import 'package:visa_arapiraca_app/presentation/widgets/termos/Impressao/rodape_termo.dart';


Future<Uint8List> generateDocument(TermoNotificacaoDTO termoNotificacao) async {

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
              PWCabecalhoParecer(titulo: "Notificação",numeroDocumento: termoNotificacao.notificacao.numeroDocumento , logoPrefeitura: logoPrefeitura, logoSecretaria: logoSecretaria, visaLogo: visaLogo),
              pw.SizedBox(height: 10),
              PWIdentificacaoEstabelecimentoParecer(
                estabelecimento: termoNotificacao.estabelecimento,
                endereco: termoNotificacao.endereco
              ),
              pw.SizedBox(height: 10),
              PWAtividadesParecer(
                atividadePrincipal: {termoNotificacao.cnae.codigo : termoNotificacao.cnae.descricao},
              ),
              pw.SizedBox(height: 12),
              PWCorpoTermoNotificacao(termo: termoNotificacao.notificacao),
              pw.SizedBox(height: 10),
              PWAssinaturasTermo(
                fiscalResponsavel: termoNotificacao.notificacao.fiscalResponsavel, 
                matriculaFiscal: termoNotificacao.notificacao.matriculaFiscal
              )
            ],
          ),
        );
      },
    ),
  );

  return pdf.save();
}
