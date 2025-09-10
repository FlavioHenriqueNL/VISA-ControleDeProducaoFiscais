import 'package:flutter/material.dart';
import 'package:visa_arapiraca_app/core/utils/form_validators.dart';
import 'package:visa_arapiraca_app/presentation/widgets/forms/formControllers/termodeinspecaoController.dart';
import 'package:visa_arapiraca_app/presentation/widgets/forms/formfield_datepicker.dart';
import 'package:visa_arapiraca_app/presentation/widgets/forms/formfield_selector.dart';

class TermoinspecaoFormwidget extends StatefulWidget {

  final Termodeinspecaocontroller controller;
  
  const TermoinspecaoFormwidget({
    required this.controller,
    super.key
  });

  @override
  State<TermoinspecaoFormwidget> createState() => _TermoinspecaoFormwidgetState();
}

class _TermoinspecaoFormwidgetState extends State<TermoinspecaoFormwidget> {
  @override
  Widget build(BuildContext context) {
    return Form(child: Column(
      children: [
        Text("Sobre a inspeção"),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: FormfieldDatepicker(
                fieldTitle: "Data da inspeção", 
                fieldController: widget.controller.dataInspecaoController,
                validator: (value) => campoVazio("Data da inspeção", value),
              ), 
            ),
            Expanded(
              flex: 1,
              child: Text("Hora da inspeção")
            ),
            Expanded(
              flex: 1,
              child: FormfieldSelector(
                fieldTitle: "Objeto da Inspeção", 
                fieldController: widget.controller.objetoInspecao, 
                options: [
                  "Estabelecimento e sua respectiva localização",
                  "Meio de transporte",
                  "Produto ou Matéria-prima"
                ],
                validator: (value) => campoVazio("Objeto da inspeção", value),
              ),
            )
          ],
        ),
        //Objeto da inspeção

      ],
    ));
  }
}