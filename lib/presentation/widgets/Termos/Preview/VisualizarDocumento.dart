import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'dart:typed_data';
import 'package:visa_arapiraca_app/presentation/widgets/Termos/Preview/analise_tecnica_pareceres.dart';
import 'package:visa_arapiraca_app/presentation/widgets/Termos/Preview/atividades_pareceres.dart';
import 'package:visa_arapiraca_app/presentation/widgets/Termos/Preview/cabecalho_pareceres.dart';
import 'package:visa_arapiraca_app/presentation/widgets/Termos/Componentes/identificacao_field_pareceres.dart';
import 'package:visa_arapiraca_app/presentation/widgets/Termos/Componentes/titulo_secao_pareceres.dart';

class PreviewParecerSanitario extends StatelessWidget {
  const PreviewParecerSanitario({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preview Parecer Sanitário'),
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
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        const CabecalhoParecer(),
                        const SizedBox(height: 20),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25),
                          child: Stack(
                            clipBehavior: Clip.none, 
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  children: [
                                    IdentificacaoField(field: "Razão Social:"),
                                    SizedBox(height: 5),
                                    IdentificacaoField(field: "Nome Fantasia:"),
                                    SizedBox(height: 5),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(child: IdentificacaoField(field: "CNPJ ou CPF:")),
                                        Expanded(child: IdentificacaoField(field: "Inscrição Estadual:")),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(child: IdentificacaoField(field: "CEP:")),
                                        Expanded(child: IdentificacaoField(field: "Endereço:"))
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(child: IdentificacaoField(field: "Telefone:")),
                                        Expanded(child: IdentificacaoField(field: "E-mail:")),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    IdentificacaoField(field: "Responsável:"),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(child: IdentificacaoField(field: "CPF do Responsável:")),
                                        Expanded(child: IdentificacaoField(field: "Código do Conselho:")),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              TituloSecaoPareceres(title:"Identificação do Estabelecimento"),
                            ],
                          ),
                        ),
                        const AtividadesParecer(atividadePrincipal: {"4771071": "Farmácias"}),
                        SizedBox(height: 10),
                        AnaliseTecnicaParecer(),
                        SizedBox(height: 25),
                        Padding(
                          padding: EdgeInsetsGeometry.symmetric(horizontal: 25),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(child: IdentificacaoField(field: "Taxa do Alvará:")),
                                  Expanded(child: IdentificacaoField(field: "Validade:")),
                                ],
                              ),
                              SizedBox(height: 35),
                              Text("Arapiraca, 01 de janeiro de 2024", style: TextStyle(fontSize: 24)),
                              SizedBox(height: 35), 
                              Text("___________________________________________", style: TextStyle(fontSize: 14)),
                              Text("Nome do fiscal", style: TextStyle(fontSize: 14)),
                            ],
                          ),
                        )
                      ],
                    ),
                  ]
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        
        onPressed: () async {
          final pdfData = await generateDocument();
          await Printing.layoutPdf(
            onLayout: (_) async => pdfData,
          );
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
              pw.Text('Preview Parecer Sanitário', style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold)),
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
              pw.Text('Análise Técnica:', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
              pw.Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
              pw.SizedBox(height: 25),
              pw.Row(
                children: [
                  pw.Expanded(child: pw.Text('Taxa do Alvará:')),
                  pw.SizedBox(width: 16),
                  pw.Expanded(child: pw.Text('Validade:')),
                ],
              ),
              pw.SizedBox(height: 35),
              pw.Text('Arapiraca, 01 de janeiro de 2024', style: pw.TextStyle(fontSize: 18)),
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