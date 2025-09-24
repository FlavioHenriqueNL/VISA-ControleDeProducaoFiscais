import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:visa_arapiraca_app/core/utils/session_helper.dart';
import 'package:visa_arapiraca_app/data/dtos/TermoInspecaoDTO.dart';
import 'package:visa_arapiraca_app/domain/entities/cnae.dart';
import 'package:visa_arapiraca_app/domain/entities/estabelecimento.dart';
import 'package:visa_arapiraca_app/domain/entities/termoInspecao.dart';
import 'package:visa_arapiraca_app/presentation/widgets/Termos/Componentes/DialogFooter.dart';
import 'package:visa_arapiraca_app/presentation/widgets/Termos/Componentes/DialogHeader.dart';
import 'package:visa_arapiraca_app/presentation/widgets/Termos/Controllers/termoInspecao_controller.dart';
import 'package:visa_arapiraca_app/presentation/widgets/Termos/Formulario/identificacaoEstabelecimento.dart';
import 'package:visa_arapiraca_app/presentation/widgets/Termos/Formulario/termoInspecao_formWidget.dart';
import 'package:visa_arapiraca_app/presentation/widgets/Componentes/scrollable_page.dart';
import 'package:visa_arapiraca_app/presentation/widgets/forms/formControllers/informacaoEstabelecimentoController.dart';

class CriarTermoinspecaoWidget extends StatefulWidget {
  const CriarTermoinspecaoWidget({super.key});

  @override
  State<CriarTermoinspecaoWidget> createState() =>
      _CriarTermoinspecaoWidgetState();
}

class _CriarTermoinspecaoWidgetState extends State<CriarTermoinspecaoWidget> {
  final TermoInspecaoController termoInspecaoController =
      TermoInspecaoController();

   //Informação de Fiscal através da Session
  final fiscalInfoSession = StaticSessionHelper();
      
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    termoInspecaoController.fiscalResponsavel.text = fiscalInfoSession.currentFiscal!.nome;
    termoInspecaoController.matriculaFiscal.text = fiscalInfoSession.currentFiscal!.matricula;
    super.initState();
  }

  void salvar() {
    print("Apenas pra saber se o botão foi acionado.");
    
    final estabelecimento = termoInspecaoController.informacaoEstabelecimento.toEntity();
    final endereco = termoInspecaoController.informacaoEstabelecimento.toEnderecoDTO();
    final atividade = termoInspecaoController.informacaoEstabelecimento.toCnaeDTO();

    String dataInspecao = termoInspecaoController.dataInspecaoController.text;
    String horaInspecao = termoInspecaoController.horaInspecaoController.text;
    DateTime dataCompletaInspecao = DateTime.parse("$dataInspecao $horaInspecao");
    
    print(dataCompletaInspecao);

    final termoDeInspecao = TermoInspecao(
      id: "", 
      numeroDocumento: termoInspecaoController.identificacaoTermo.text,
      numeroProcesso: termoInspecaoController.informacaoEstabelecimento.numeroProcessoController.text, 
      cnpj: termoInspecaoController.informacaoEstabelecimento.cpfCnpjController.text, 
      razaoSocial: termoInspecaoController.informacaoEstabelecimento.razaoSocialController.text, 
      cnaePrincipal: termoInspecaoController.informacaoEstabelecimento.cnaeController.text, 
      dataCompleta: dataCompletaInspecao,
      objetoInspecao: termoInspecaoController.objetoInspecao.text,
      fatoInspecao: termoInspecaoController.fatoInspecao.text,
      fundamentosLegais: termoInspecaoController.fundamentosLegais.text,
      fiscalResponsavel: termoInspecaoController.fiscalResponsavel.text,
      matriculaFiscal: termoInspecaoController.matriculaFiscal.text
    );


    final termoDTO = TermoInspecaoDTO(
      estabelecimento: estabelecimento,
      cnae: atividade,
      endereco: endereco,
      termoInspecao: termoDeInspecao,
    );

    if (_formKey.currentState!.validate()) {
      context.pop(termoDTO);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.all(16),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.93,
        height: MediaQuery.of(context).size.height * 0.93,
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
        child: Column(
          children: [
            DialogHeader(
              headerTitle: "Criar Termo de Inspeção",
              headerSubtitle:
                  "Preencha os campos abaixo para criar um novo Termo de Inspeção",
            ),
            Divider(height: 30),

            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // Identificação do Estabelecimento
                      IdentificacaoestabelecimentoFormWidget(
                        controller:
                            termoInspecaoController.informacaoEstabelecimento,
                      ),
                      SizedBox(height: 30),
                      // Análise Técnica
                      TermoinspecaoFormwidget(
                        controller: termoInspecaoController,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Divider(height: 30),
            DialogFooter(salvar: salvar),
          ],
        ),
      ),
    );
  }
}
