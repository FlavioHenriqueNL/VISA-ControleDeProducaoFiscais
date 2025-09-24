import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:visa_arapiraca_app/core/utils/session_helper.dart';
import 'package:visa_arapiraca_app/data/dtos/TermoNotificacaoDTO.dart';
import 'package:visa_arapiraca_app/domain/entities/notificacao.dart';
import 'package:visa_arapiraca_app/presentation/widgets/forms/formControllers/informacaoEstabelecimentoController.dart';
import 'package:visa_arapiraca_app/presentation/widgets/termos/Componentes/DialogFooter.dart';
import 'package:visa_arapiraca_app/presentation/widgets/termos/Componentes/DialogHeader.dart';
import 'package:visa_arapiraca_app/presentation/widgets/termos/Controllers/termoNotificacao_controller.dart';
import 'package:visa_arapiraca_app/presentation/widgets/termos/Formulario/identificacaoEstabelecimento.dart';
import 'package:visa_arapiraca_app/presentation/widgets/termos/Formulario/termoNotificacao_formWidget.dart';

class CriarTermoNotificacaoWidget extends StatefulWidget {
  

  const CriarTermoNotificacaoWidget({
    super.key
  });

  @override
  State<CriarTermoNotificacaoWidget> createState() => _CriarTermoNotificacaoWidgetState();
}

class _CriarTermoNotificacaoWidgetState extends State<CriarTermoNotificacaoWidget> {

  final TermoNotificacaoController controller = TermoNotificacaoController();
  final fiscalInfoSession = StaticSessionHelper();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    
    controller.fiscalResponsavel.text = fiscalInfoSession.currentFiscal!.nome;
    controller.matriculaFiscal.text = fiscalInfoSession.currentFiscal!.matricula;
    super.initState();
  }

  void salvar() {

    String dataInspecao = controller.dataInspecaoController.text;
    String horaInspecao = controller.horaInspecaoController.text;
    DateTime dataCompletaInspecao = DateTime.parse("$dataInspecao $horaInspecao");

    final notificacao = Notificacao(
      cnpj: controller.informacaoEstabelecimento.cpfCnpjController.text, 
      razaoSocial: controller.informacaoEstabelecimento.razaoSocialController.text, 
      dataEmissao: dataCompletaInspecao, 
      exigencias: controller.exigenciasController.text, 
      fundamentoLegal: controller.fundamentosLegaisController.text, 
      prazo: controller.prazoController.text, 
      fiscalResponsavel: controller.fiscalResponsavel.text, 
      matriculaFiscal: controller.matriculaFiscal.text, 
      numeroDocumento: controller.numeroDocumentoController.text
    );
    

    final estabelecimento = controller.informacaoEstabelecimento.toEntity();
    final cnaeCompleto = controller.informacaoEstabelecimento.toCnaeDTO();
    final enderecoCompleto = controller.informacaoEstabelecimento.toEnderecoDTO();

    final notificacaoCompleta = TermoNotificacaoDTO(
      estabelecimento: estabelecimento,
      cnae: cnaeCompleto,
      endereco: enderecoCompleto,
      notificacao: notificacao,
    );

    if (_formKey.currentState!.validate()) {
      context.pop(notificacaoCompleta);
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
                            controller.informacaoEstabelecimento,
                      ),
                      SizedBox(height: 30),
                      // Análise Técnica
                      TermoNotificacaoFormWidget(controller: controller)
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