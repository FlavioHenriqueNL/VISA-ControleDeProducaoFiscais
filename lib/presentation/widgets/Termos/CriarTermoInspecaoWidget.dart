import 'package:flutter/material.dart';
import 'package:visa_arapiraca_app/presentation/widgets/Termos/Componentes/DialogHeader.dart';
import 'package:visa_arapiraca_app/presentation/widgets/Termos/Controllers/termodeinspecaoController.dart';
import 'package:visa_arapiraca_app/presentation/widgets/Termos/Formulario/identificacaoEstabelecimento.dart';
import 'package:visa_arapiraca_app/presentation/widgets/Termos/Formulario/termoInspecao_formWidget.dart';
import 'package:visa_arapiraca_app/presentation/widgets/Componentes/scrollable_page.dart';

class CriarTermoinspecaoWidget extends StatefulWidget {
  const CriarTermoinspecaoWidget({super.key});

  @override
  State<CriarTermoinspecaoWidget> createState() => _CriarTermoinspecaoWidgetState();
}

class _CriarTermoinspecaoWidgetState extends State<CriarTermoinspecaoWidget> {
  
  final TermoInspecaoController termoInspecaoController = TermoInspecaoController(); 
  final _formKey = GlobalKey<FormState>();

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
              headerSubtitle: "Preencha os campos abaixo para criar um novo Termo de Inspeção",
            ),
            Divider(height: 20),

            Expanded(child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    // Identificação do Estabelecimento
                    IdentificacaoestabelecimentoFormWidget(
                      controller: termoInspecaoController.informacaoEstabelecimento
                    ),
                    SizedBox(height: 30),
                    // Análise Técnica
                    TermoinspecaoFormwidget(controller: termoInspecaoController)
                  ],
                ),
              ),
            ))

          ],
        ),
          
      ),
    );
    
  }
}