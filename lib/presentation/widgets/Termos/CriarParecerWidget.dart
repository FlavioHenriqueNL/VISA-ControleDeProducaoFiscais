import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:visa_arapiraca_app/core/utils/session_helper.dart';
import 'package:visa_arapiraca_app/data/dtos/CnaeDTO.dart';
import 'package:visa_arapiraca_app/data/dtos/EnderecoDTO.dart';
import 'package:visa_arapiraca_app/data/dtos/ParecerDTO.dart';
import 'package:visa_arapiraca_app/domain/entities/estabelecimento.dart';
import 'package:visa_arapiraca_app/domain/entities/parecersanitario.dart';
import 'package:visa_arapiraca_app/presentation/widgets/forms/formControllers/informacaoEstabelecimentoController.dart';
import 'package:visa_arapiraca_app/presentation/widgets/termos/Controllers/parecerTecnico_controller.dart';
import 'package:visa_arapiraca_app/presentation/widgets/termos/Formulario/analiseTecnicaWidget.dart';
import 'package:visa_arapiraca_app/presentation/widgets/Termos/Componentes/DialogHeader.dart';
import 'package:visa_arapiraca_app/presentation/widgets/Termos/Formulario/identificacaoEstabelecimento.dart';
import 'package:visa_arapiraca_app/presentation/widgets/Componentes/scrollable_page.dart';

class CriarParecerWidget extends StatefulWidget {
  const CriarParecerWidget({super.key});

  @override
  State<CriarParecerWidget> createState() => _CriarParecerWidgetState();
}

class _CriarParecerWidgetState extends State<CriarParecerWidget> {
  //Formulário Controllers
  final ParecerTecnicoController parecerTecnicoController =
      ParecerTecnicoController();

  //Informação de Fiscal através da Session
  final fiscalInfoSession = StaticSessionHelper();
  
  @override
  void initState() {
    super.initState();
    parecerTecnicoController.informacaoFiscal.matriculaFiscal.text = fiscalInfoSession.currentFiscal!.matricula;
    parecerTecnicoController.informacaoFiscal.nomeFiscal.text = fiscalInfoSession.currentFiscal!.nome;
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
      numeroProcesso: parecerTecnicoController.informacaoEstabelecimento.numeroProcessoController.text,
      cnaePrincipal: parecerTecnicoController.informacaoEstabelecimento.cnaeController.text,
      analiseTecnica: parecerTecnicoController.parecerController.text,
      validade: parecerTecnicoController.validadeAlvaraController.text,
      taxa: parecerTecnicoController.taxaAlvaraController.text,
      matriculaFiscal: parecerTecnicoController.informacaoFiscal.matriculaFiscal.text, // Manter o CPF do fiscal existente
    );

    final estabelecimento = parecerTecnicoController.informacaoEstabelecimento.toEntity();
    final cnaeCompleto = parecerTecnicoController.informacaoEstabelecimento.toCnaeDTO();
    final enderecoCompleto = parecerTecnicoController.informacaoEstabelecimento.toEnderecoDTO();

    final parecerCompleto = ParecerDTO(
      estabelecimento: estabelecimento,
      cnae: cnaeCompleto,
      endereco: enderecoCompleto,
      parecerSanitario: parecer,
    );

    if (_formKey.currentState!.validate()) {
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
              //Header
              DialogHeader(
                headerTitle: "Criar Parecer sanitário",
                headerSubtitle:
                    "Preencha os campos abaixo para criar um novo parecer.",
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
