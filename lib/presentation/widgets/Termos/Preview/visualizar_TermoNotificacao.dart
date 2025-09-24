import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:visa_arapiraca_app/data/dtos/TermoNotificacaoDTO.dart';
import 'package:visa_arapiraca_app/presentation/widgets/termos/Impressao/gerar_termoNotificacao.dart';
import 'package:visa_arapiraca_app/presentation/widgets/termos/Preview/cabecalho_documento.dart';
import 'package:visa_arapiraca_app/presentation/widgets/termos/Preview/corpo_termoNotificacao.dart';
import 'package:visa_arapiraca_app/presentation/widgets/termos/Preview/identificacaoEstabelecimento_documento.dart';
import 'package:visa_arapiraca_app/presentation/widgets/termos/Preview/atividades_documento.dart';
import 'package:visa_arapiraca_app/presentation/widgets/termos/Preview/rodape_termo.dart';


class PreviewTermoNotificacao extends StatelessWidget {
  final TermoNotificacaoDTO termoNotificacao;

  const PreviewTermoNotificacao({super.key, required this.termoNotificacao});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pré-visualização do Termo de Notificação'),
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
                    CabecalhoDocumento(titulo: "Notificação",numeroDocumento: termoNotificacao.notificacao.numeroDocumento),
                    const SizedBox(height: 40),

                    IdentificacaoEstabelecimentoParecer(
                      estabelecimento: termoNotificacao.estabelecimento,
                      endereco: termoNotificacao.endereco,
                    ),
                    const SizedBox(height: 30),

                    AtividadesDocumento(atividadePrincipal: {
                        termoNotificacao.cnae.codigo : termoNotificacao.cnae.descricao,
                    }),
                    const SizedBox(height: 30),

                    CorpoTermoNotificacao(termo: termoNotificacao.notificacao),
                    const SizedBox(height: 75),

                    AssinaturasTermo(
                      fiscalResponsavel: termoNotificacao.notificacao.fiscalResponsavel, 
                      matriculaFiscal: termoNotificacao.notificacao.matriculaFiscal,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final pdfData = await generateDocument(termoNotificacao);
          await Printing.layoutPdf(onLayout: (_) async => pdfData);
        },
        icon: const Icon(Icons.print),
        label: const Text('Imprimir PDF'),
      ),
    );
  }
}

// Função para gerar o PDF (pode ficar no final do arquivo)
