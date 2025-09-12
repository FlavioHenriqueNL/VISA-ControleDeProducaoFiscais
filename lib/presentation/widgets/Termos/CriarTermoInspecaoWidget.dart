import 'package:flutter/material.dart';
import 'package:visa_arapiraca_app/domain/entities/estabelecimento.dart';
import 'package:visa_arapiraca_app/domain/entities/termoInspecao.dart';
import 'package:visa_arapiraca_app/presentation/widgets/Termos/Componentes/DialogFooter.dart';
import 'package:visa_arapiraca_app/presentation/widgets/Termos/Componentes/DialogHeader.dart';
import 'package:visa_arapiraca_app/presentation/widgets/Termos/Controllers/termoInspecao_controller.dart';
import 'package:visa_arapiraca_app/presentation/widgets/Termos/Formulario/identificacaoEstabelecimento.dart';
import 'package:visa_arapiraca_app/presentation/widgets/Termos/Formulario/termoInspecao_formWidget.dart';
import 'package:visa_arapiraca_app/presentation/widgets/Componentes/scrollable_page.dart';

class CriarTermoinspecaoWidget extends StatefulWidget {
  const CriarTermoinspecaoWidget({super.key});

  @override
  State<CriarTermoinspecaoWidget> createState() =>
      _CriarTermoinspecaoWidgetState();
}

class _CriarTermoinspecaoWidgetState extends State<CriarTermoinspecaoWidget> {
  final TermoInspecaoController termoInspecaoController =
      TermoInspecaoController();
  final _formKey = GlobalKey<FormState>();

  void salvar() {
    print("Apenas pra saber se o botão foi acionado.");
    final estabelecimento = Estabelecimento(
      numeroAlvara: termoInspecaoController.informacaoEstabelecimento.numeroProcessoController.text,
      cpfCnpj: termoInspecaoController.informacaoEstabelecimento.cpfCnpjController.text,
      razaoSocial: termoInspecaoController.informacaoEstabelecimento.razaoSocialController.text,
      nomeFantasia: termoInspecaoController.informacaoEstabelecimento.nomeFantasiaController.text,
      telefone: termoInspecaoController.informacaoEstabelecimento.telefoneController.text,
      email: termoInspecaoController.informacaoEstabelecimento.emailController.text,
      cnae: termoInspecaoController.informacaoEstabelecimento.cnaeController.text,
      cep: termoInspecaoController.informacaoEstabelecimento.cepController.text,
      numeroResidencia: termoInspecaoController.informacaoEstabelecimento.numeroResidenciaController.text,
      complemento: termoInspecaoController.informacaoEstabelecimento.complementoController.text,
      responsavel: termoInspecaoController.informacaoEstabelecimento.responsavelController.text,
      cpfResponsavel: termoInspecaoController.informacaoEstabelecimento.cpfResponsavelController.text,
      codigoConselho: 
        termoInspecaoController.informacaoEstabelecimento.codigoConselhoController.text.isNotEmpty
          ? 
        termoInspecaoController.informacaoEstabelecimento.codigoConselhoController.text
          : null,
    );

    final termoDeInspecao = TermoInspecao(
      id: "", 
      numeroProcesso: termoInspecaoController.informacaoEstabelecimento.numeroProcessoController.text, 
      cnpj: termoInspecaoController.informacaoEstabelecimento.cpfCnpjController.text, 
      razaoSocial: termoInspecaoController.informacaoEstabelecimento.razaoSocialController.text, 
      cnaePrincipal: termoInspecaoController.informacaoEstabelecimento.cnaeController.text, 
      data: DateTime.parse(termoInspecaoController.dataInspecaoController.text), 
      hora: DateTime.parse(termoInspecaoController.horaInspecaoController.text),
      objetoInspecao: termoInspecaoController.objetoInspecao.text,
      fatoInspecao: termoInspecaoController.fatoInspecao.text,
      fundamentosLegais: termoInspecaoController.fundamentosLegais.text,
      fiscalResponsavel: termoInspecaoController.fiscalResponsavel.text,
      matriculaFiscal: termoInspecaoController.matriculaFiscal.text
    );
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
