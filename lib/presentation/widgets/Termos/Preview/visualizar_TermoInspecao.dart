import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:visa_arapiraca_app/data/dtos/ParecerDTO.dart';
import 'package:visa_arapiraca_app/data/dtos/TermoInspecaoDTO.dart';
import 'package:visa_arapiraca_app/presentation/widgets/termos/Impressao/GerarParecer.dart';
import 'package:visa_arapiraca_app/presentation/widgets/termos/Preview/analisetecnica_pareceres.dart';
import 'package:visa_arapiraca_app/presentation/widgets/termos/Preview/assinaturas_termo.dart';
import 'package:visa_arapiraca_app/presentation/widgets/termos/Preview/atividades_pareceres.dart';
import 'package:visa_arapiraca_app/presentation/widgets/termos/Preview/cabecalho_pareceres.dart';
import 'package:visa_arapiraca_app/presentation/widgets/termos/Preview/identificacaoestabelecimento_pareceres.dart';
import 'package:visa_arapiraca_app/presentation/widgets/termos/Preview/info_termoInspecao.dart';
import 'package:visa_arapiraca_app/presentation/widgets/termos/Preview/rodape_pareceres.dart';

class PreviewTermoInspecao extends StatelessWidget {
  final TermoInspecaoDTO termoInspecao;

  const PreviewTermoInspecao({super.key, required this.termoInspecao});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pré-visualização do Termo de Inspeção'),
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
                      estabelecimento: termoInspecao.estabelecimento,
                      endereco: termoInspecao.endereco,
                    ),
                    const SizedBox(height: 30),
                    AtividadesParecer(
                      atividadePrincipal: {
                        termoInspecao.cnae.codigo : termoInspecao.cnae.descricao,
                      },
                      
                    ),
                    const SizedBox(height: 30),
                    InfoTermoInspecao(termo: termoInspecao.termoInspecao,),
                    const SizedBox(height: 75),
                    AssinaturasTermo(
                      fiscalResponsavel: termoInspecao.termoInspecao.fiscalResponsavel, 
                      matriculaFiscal: termoInspecao.termoInspecao.matriculaFiscal,
                    )
                    
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => {},
        // onPressed: () async {
        //   final pdfData = await generateDocument(termoInspecaoDTO);
        //   await Printing.layoutPdf(onLayout: (_) async => pdfData);
        // },
        icon: const Icon(Icons.print),
        label: const Text('Imprimir PDF'),
      ),
    );
  }
}

// Função para gerar o PDF (pode ficar no final do arquivo)
