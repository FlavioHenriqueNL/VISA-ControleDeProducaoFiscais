import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:visa_arapiraca_app/data/dtos/ParecerDTO.dart';
import 'package:visa_arapiraca_app/presentation/widgets/ParecerSanitario/Impressao/GerarParecer.dart';
import 'package:visa_arapiraca_app/presentation/widgets/ParecerSanitario/Preview/analisetecnica_pareceres.dart';
import 'package:visa_arapiraca_app/presentation/widgets/ParecerSanitario/Preview/atividades_pareceres.dart';
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
          final pdfData = await generateDocument(parecerSanitario);
          await Printing.layoutPdf(onLayout: (_) async => pdfData);
        },
        icon: const Icon(Icons.print),
        label: const Text('Imprimir PDF'),
      ),
    );
  }
}

// Função para gerar o PDF (pode ficar no final do arquivo)
