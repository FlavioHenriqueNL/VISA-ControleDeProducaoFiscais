import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:visa_arapiraca_app/data/dtos/ParecerDTO.dart';
import 'package:visa_arapiraca_app/domain/entities/estabelecimento.dart';
import 'package:visa_arapiraca_app/domain/entities/parecersanitario.dart';
import 'package:visa_arapiraca_app/presentation/widgets/ParecerSanitario/Controllers/ParecerTecnicoController.dart';
import 'package:visa_arapiraca_app/presentation/widgets/ParecerSanitario/Formulario/analiseTecnicaWidget.dart';
import 'package:visa_arapiraca_app/presentation/widgets/Termos/Formulario/identificacaoEstabelecimento.dart';
import 'package:visa_arapiraca_app/presentation/widgets/scrollable_page.dart';

class CriarParecerWidget extends StatefulWidget {
  const CriarParecerWidget({super.key});

  @override
  State<CriarParecerWidget> createState() => _CriarParecerWidgetState();
}

class _CriarParecerWidgetState extends State<CriarParecerWidget> {
  //Formulário Controllers
  final ParecerTecnicoController parecerTecnicoController =
      ParecerTecnicoController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    parecerTecnicoController.dispose();
    super.dispose();
  }

  void salvarParecer() {
    final parecer = ParecerSanitario(
      id: "", // ID será gerado pelo backend
      cnpj: parecerTecnicoController.informacaoEstabelecimento.cpfCnpjController.text,
      razaoSocial: parecerTecnicoController.informacaoEstabelecimento.razaoSocialController.text,
      data: DateTime.now(),
      numeroProcesso: parecerTecnicoController
          .informacaoEstabelecimento
          .numeroProcessoController
          .text,
      cnaePrincipal: parecerTecnicoController
          .informacaoEstabelecimento
          .cnaeController
          .text,
      analiseTecnica: parecerTecnicoController.parecerController.text,
      validade: parecerTecnicoController.validadeAlvaraController.text,
      taxa: parecerTecnicoController.taxaAlvaraController.text,
      cpfFiscal: "10512310432", // Manter o CPF do fiscal existente
    );

    final estabelecimento = Estabelecimento(
      numeroAlvara: parecerTecnicoController
          .informacaoEstabelecimento
          .numeroProcessoController
          .text,
        cpfCnpj: parecerTecnicoController
          .informacaoEstabelecimento
          .cpfCnpjController
          .text,
      razaoSocial: parecerTecnicoController
          .informacaoEstabelecimento
          .razaoSocialController
          .text,
      nomeFantasia: parecerTecnicoController
          .informacaoEstabelecimento
          .nomeFantasiaController
          .text,
      telefone: parecerTecnicoController
          .informacaoEstabelecimento
          .telefoneController
          .text,
      email: parecerTecnicoController
          .informacaoEstabelecimento
          .emailController
          .text,
      cnae: parecerTecnicoController
          .informacaoEstabelecimento
          .cnaeController
          .text,
      cep:
          parecerTecnicoController.informacaoEstabelecimento.cepController.text,
      numeroResidencia: parecerTecnicoController
          .informacaoEstabelecimento
          .numeroResidenciaController
          .text,
      complemento: parecerTecnicoController
          .informacaoEstabelecimento
          .complementoController
          .text,
      responsavel: parecerTecnicoController
          .informacaoEstabelecimento
          .responsavelController
          .text,
      cpfResponsavel: parecerTecnicoController
          .informacaoEstabelecimento
          .cpfResponsavelController
          .text,
      codigoConselho:
          parecerTecnicoController
              .informacaoEstabelecimento
              .codigoConselhoController
              .text
              .isNotEmpty
          ? parecerTecnicoController
                .informacaoEstabelecimento
                .codigoConselhoController
                .text
          : null,
    );

    final parecerCompleto = ParecerDTO(
      estabelecimento: estabelecimento,
      parecerSanitario: parecer,
    );

    if(_formKey.currentState!.validate()){
      context.pop(parecerCompleto);
    }

  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ScrollablePage(
      child: Dialog(
        insetPadding: EdgeInsets.all(16),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.93,
          height: MediaQuery.of(context).size.height * 0.93,
          color: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ListTile(
                      leading: Icon(
                        Icons.add_chart_outlined,
                        size: 40,
                        color: Colors.blue,
                      ),
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        "Criar Parecer Sanitário",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        "Preencha os campos abaixo para criar um novo parecer.",
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.close),
                    iconSize: 40,
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
              Divider(),
              SizedBox(height: 20),

              //Corpo do Formulário
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        // Identificação do Estabelecimento
                        IdentificacaoestabelecimentoFormWidget(
                          controller: parecerTecnicoController
                              .informacaoEstabelecimento, 
                        ),
                        SizedBox(height: 30),
                        // Análise Técnica
                        AnaliseTecnicaForm(
                          controller: parecerTecnicoController,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),

              //Botões Ações
              Padding(
                padding: EdgeInsets.only(right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton.icon(
                      style: ParecerBottomWidgetStyle.copyWith(
                        backgroundColor: WidgetStateProperty.all<Color>(
                          Colors.red,
                        ),
                        foregroundColor: WidgetStateProperty.all<Color>(
                          Colors.white,
                        ),
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                      label: Text("Cancelar", style: TextStyle(fontSize: 16)),
                      icon: Icon(
                        Icons.cancel_rounded,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),

                    SizedBox(width: 20),

                    ElevatedButton.icon(
                      style: ParecerBottomWidgetStyle.copyWith(
                        backgroundColor: WidgetStateProperty.all<Color>(
                          Colors.yellow.shade600,
                        ),
                        foregroundColor: WidgetStateProperty.all<Color>(
                          Colors.white,
                        ),
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                      label: Text("Limpar", style: TextStyle(fontSize: 16)),
                      icon: Icon(
                        Icons.cleaning_services,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),

                    SizedBox(width: 20),
                    ElevatedButton.icon(
                      style: ParecerBottomWidgetStyle.copyWith(
                        backgroundColor: WidgetStateProperty.all<Color>(
                          Colors.green,
                        ),
                        foregroundColor: WidgetStateProperty.all<Color>(
                          Colors.white,
                        ),
                      ),
                      onPressed: () {
                        salvarParecer();
                      },
                      label: Text(
                        "Salvar Alterações",
                        style: TextStyle(fontSize: 16),
                      ),
                      icon: Icon(Icons.save, color: Colors.white, size: 20),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Estilo padrão para os botões do parecer sanitário
final ParecerBottomWidgetStyle = ElevatedButton.styleFrom(
  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
);
