import 'package:flutter/material.dart';
import 'package:visa_arapiraca_app/core/utils/form_validators.dart';
import 'package:visa_arapiraca_app/presentation/widgets/forms/formfield_datepicker.dart';
import 'package:visa_arapiraca_app/presentation/widgets/forms/formfield_parecer.dart';
import 'package:visa_arapiraca_app/presentation/widgets/forms/formfield_timepicker.dart';
import 'package:visa_arapiraca_app/presentation/widgets/termos/Controllers/termoNotificacao_controller.dart';

class TermoNotificacaoFormWidget extends StatelessWidget {

  final TermoNotificacaoController controller; 
  const TermoNotificacaoFormWidget({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Sobre a Notificação",style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
        SizedBox(height: 25,),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: FormfieldParecer(
                fieldTitle: "Número do Termo",
                fieldController: controller.numeroDocumentoController,
                validator: (value) => campoVazio("Número do Termo", value),
              ), 
            ),
            SizedBox(width: 25,),
            Expanded(
              flex: 1,
              child: FormfieldDatepicker(
                fieldTitle: "Data do ocorrido", 
                fieldController: controller.dataInspecaoController,
                validator: (value) => campoVazio("Data do ocorrido", value),
              ), 
            ),
            SizedBox(width: 25,),
            Expanded(
              flex: 1,
              child: FormfieldTimepicker(
                fieldTitle: "Hora da ocorrido", 
                validator: (value) => campoVazio("Hora do ocorrido", value),
                fieldController: controller.horaInspecaoController
              )
            ),
            SizedBox(width: 25,),
            Expanded(
              flex: 1,
              child: FormfieldDatepicker(
                fieldTitle: "Prazo", 
                validator: (value) => campoVazio("Hora do ocorrido", value),
                fieldController: controller.prazoController
              )
            ),
            SizedBox(width: 25,),
            
          ],
        ),

        SizedBox(height: 25),
        
        SizedBox(
          height: 200,
          child: TextFormField(
            controller: controller.exigenciasController,
            maxLines: null,
            expands: true,
            keyboardType: TextInputType.multiline,
            textAlignVertical: TextAlignVertical.top,
            decoration: InputDecoration(
              labelText: "Constatamos o seguinte:",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              border: OutlineInputBorder(),
            ),
            validator: (value) => campoVazio("Exigências solicitadas", value),
          ),
        ),

        SizedBox(height: 25),

        SizedBox(
          height: 100,
          child: TextFormField(
            controller: controller.fundamentosLegaisController,
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

        SizedBox(
          height: 100,
          child: TextFormField(
            controller: controller.observacoesController,
            maxLines: null,
            expands: true,
            keyboardType: TextInputType.multiline,
            textAlignVertical: TextAlignVertical.top,
            decoration: InputDecoration(
              labelText: "Observações",
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
                fieldController: controller.fiscalResponsavel,
                validator: (value) => campoVazio("Nome do fiscal", value),
              )
            ),
            SizedBox(width: 25),
            Expanded(
              flex: 1,
              child: FormfieldParecer(
                fieldTitle: "Matricula do Fiscal", 
                fieldController: controller.matriculaFiscal,
                validator: (value) => campoVazio("Matrícula do fiscal", value),
              )
            ),
          ],
        )
      ],
    );
  }
}