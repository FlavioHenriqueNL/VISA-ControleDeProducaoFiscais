import 'package:flutter/material.dart';
import 'package:visa_arapiraca_app/core/utils/form_validators.dart';
import 'package:visa_arapiraca_app/presentation/widgets/Termos/Controllers/termoInspecao_controller.dart';
import 'package:visa_arapiraca_app/presentation/widgets/forms/formfield_datepicker.dart';
import 'package:visa_arapiraca_app/presentation/widgets/forms/formfield_parecer.dart';
import 'package:visa_arapiraca_app/presentation/widgets/forms/formfield_selector.dart';
import 'package:visa_arapiraca_app/presentation/widgets/forms/formfield_timepicker.dart';

class TermoinspecaoFormwidget extends StatefulWidget {

  final TermoInspecaoController controller;
  
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
            SizedBox(width: 25,),
            Expanded(
              flex: 1,
              child: FormfieldTimepicker(
                fieldTitle: "Hora da inspeção", 
                fieldController: widget.controller.horaInspecaoController
              )
            ),
            SizedBox(width: 25,),
            Expanded(
              flex: 5,
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

        SizedBox(height: 25),
        
        SizedBox(
          height: 200,
          child: TextFormField(
            controller: widget.controller.fatoInspecao,
            maxLines: null,
            expands: true,
            keyboardType: TextInputType.multiline,
            textAlignVertical: TextAlignVertical.top,
            decoration: InputDecoration(
              labelText: "Constatamos o seguinte:",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              border: OutlineInputBorder(),
            ),
            validator: (value) => null,
          ),
        ),

        SizedBox(height: 25),

        SizedBox(
          height: 100,
          child: TextFormField(
            controller: widget.controller.fatoInspecao,
            maxLines: null,
            expands: true,
            keyboardType: TextInputType.multiline,
            textAlignVertical: TextAlignVertical.top,
            decoration: InputDecoration(
              labelText: "Fundamentos Legais",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              border: OutlineInputBorder(),
            ),
            validator: (value) => null,
          ),
        ),

        SizedBox(height: 25),

        Row(
          children: [
            Expanded(
              flex: 1,
              child: FormfieldParecer(
                fieldTitle: "Fiscal Responsável", 
                fieldController: widget.controller.fiscalResponsavel,
                validator: (value) => campoVazio("Nome do fiscal", value),
              )
            ),
            SizedBox(width: 25),
            Expanded(
              flex: 1,
              child: FormfieldParecer(
                fieldTitle: "Matricula do Fiscal", 
                fieldController: widget.controller.matriculaFiscal,
                validator: (value) => campoVazio("Matrícula do fiscal", value),
              )
            ),
          ],
        )
      ],
    ));
  }
}