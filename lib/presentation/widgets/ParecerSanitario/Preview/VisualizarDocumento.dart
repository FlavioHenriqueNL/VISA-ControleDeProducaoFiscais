import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:visa_arapiraca_app/data/dtos/ParecerDTO.dart';
import 'package:visa_arapiraca_app/presentation/widgets/ParecerSanitario/Preview/analisetecnica_pareceres.dart';
import 'package:visa_arapiraca_app/presentation/widgets/ParecerSanitario/Preview/atividades_pareceres.dart';
import 'dart:typed_data';
import 'package:visa_arapiraca_app/presentation/widgets/ParecerSanitario/Preview/cabecalho_pareceres.dart';
import 'package:visa_arapiraca_app/presentation/widgets/ParecerSanitario/Preview/identificacaoestabelecimento_pareceres.dart';
import 'package:visa_arapiraca_app/presentation/widgets/ParecerSanitario/Preview/rodape_pareceres.dart';

class PreviewParecerSanitario extends StatelessWidget {
  final ParecerDTO parecerSanitario;

  const PreviewParecerSanitario({super.key, required this.parecerSanitario});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pré-visualização do Parecer Sanitário'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 720,
              minHeight: 1280,
              maxWidth: 1280,
            ),
            child: InteractiveViewer(
              boundaryMargin: const EdgeInsets.all(80.0),
              minScale: 0.001,
              maxScale: 30.0,
              child: Container(
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CabecalhoParecer(),
                    const SizedBox(height: 40),
                    IdentificacaoEstabelecimentoParecer(
                      estabelecimento: parecerSanitario.estabelecimento,
                    ),
                    const SizedBox(height: 30),
                    AtividadesParecer(
                      atividadePrincipal: {
                        parecerSanitario.estabelecimento.cnae: "",
                      },
                    ),
                    const SizedBox(height: 30),
                    AnaliseTecnicaParecer(
                      analiseTecnica:
                          parecerSanitario.parecerSanitario.analiseTecnica,
                    ),
                    const SizedBox(height: 75),
                    RodapeParecer(
                      parecerSanitario: parecerSanitario.parecerSanitario,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final pdfData = await generateDocument();
          await Printing.layoutPdf(onLayout: (_) async => pdfData);
        },
        icon: const Icon(Icons.print),
        label: const Text('Imprimir PDF'),
      ),
    );
  }
}

// Função para gerar o PDF (pode ficar no final do arquivo)
Future<Uint8List> generateDocument() async {
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
              pw.Text(
                'Preview Parecer Sanitário',
                style: pw.TextStyle(
                  fontSize: 24,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.SizedBox(height: 20),
              pw.Container(
                decoration: pw.BoxDecoration(
                  border: pw.Border.all(color: PdfColors.grey, width: 1),
                  borderRadius: pw.BorderRadius.circular(8),
                ),
                padding: const pw.EdgeInsets.all(16),
                child: pw.Column(
                  children: [
                    pw.Text('Razão Social:'),
                    pw.SizedBox(height: 5),
                    pw.Text('Nome Fantasia:'),
                    pw.SizedBox(height: 5),
                    pw.Row(
                      children: [
                        pw.Expanded(child: pw.Text('CNPJ ou CPF:')),
                        pw.SizedBox(width: 16),
                        pw.Expanded(child: pw.Text('Inscrição Estadual:')),
                      ],
                    ),
                    pw.SizedBox(height: 10),
                    pw.Row(
                      children: [
                        pw.Expanded(child: pw.Text('CEP:')),
                        pw.SizedBox(width: 16),
                        pw.Expanded(child: pw.Text('Endereço:')),
                      ],
                    ),
                    pw.SizedBox(height: 5),
                    pw.Row(
                      children: [
                        pw.Expanded(child: pw.Text('Telefone:')),
                        pw.SizedBox(width: 16),
                        pw.Expanded(child: pw.Text('E-mail:')),
                      ],
                    ),
                    pw.SizedBox(height: 10),
                    pw.Text('Responsável:'),
                    pw.Row(
                      children: [
                        pw.Expanded(child: pw.Text('CPF do Responsável:')),
                        pw.SizedBox(width: 16),
                        pw.Expanded(child: pw.Text('Código do Conselho:')),
                      ],
                    ),
                  ],
                ),
              ),
              pw.SizedBox(height: 20),
              pw.Text('Atividade Principal: Farmácias'),
              pw.SizedBox(height: 10),
              pw.Text(
                'Análise Técnica:',
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
              ),
              pw.Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
              ),
              pw.SizedBox(height: 25),
              pw.Row(
                children: [
                  pw.Expanded(child: pw.Text('Taxa do Alvará:')),
                  pw.SizedBox(width: 16),
                  pw.Expanded(child: pw.Text('Validade:')),
                ],
              ),
              pw.SizedBox(height: 35),
              pw.Text(
                'Arapiraca, 01 de janeiro de 2024',
                style: pw.TextStyle(fontSize: 18),
              ),
              pw.SizedBox(height: 35),
              pw.Text('___________________________________________'),
              pw.Text('Nome do fiscal'),
            ],
          ),
        );
      },
    ),
  );

  return pdf.save();
}
