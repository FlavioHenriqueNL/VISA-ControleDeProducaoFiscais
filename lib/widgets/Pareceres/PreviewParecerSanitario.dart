import 'package:flutter/material.dart';
import 'package:visa_arapiraca_app/widgets/Pareceres/analise_tecnica_pareceres.dart';
import 'package:visa_arapiraca_app/widgets/Pareceres/atividades_pareceres.dart';
import 'package:visa_arapiraca_app/widgets/Pareceres/cabecalho_pareceres.dart';
import 'package:visa_arapiraca_app/widgets/Pareceres/identificacao_field_pareceres.dart';
import 'package:visa_arapiraca_app/widgets/Pareceres/titulo_secao_pareceres.dart';

class PreviewParecerSanitario extends StatelessWidget {
  const PreviewParecerSanitario({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preview Parecer Sanitário'),
      ),
      body: InteractiveViewer(
        boundaryMargin: const EdgeInsets.all(80.0),
        minScale: 0.001,
        maxScale: 30.0,
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 720,
              minHeight: 1280,
              maxWidth: 1280,
            ),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                color: Colors.white,
              ),
              child: SingleChildScrollView( // Adicionado para evitar overflow
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
        onPressed: () {},
        // onPressed: () async {
        //   final pdfData = await generateDocument(data);
        //   await Printing.layoutPdf(
        //     onLayout: (_) async => pdfData,
        //   );
        // },
        icon: const Icon(Icons.print),
        label: const Text('Imprimir PDF'),
      ),
    );
  }
}