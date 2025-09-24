import 'package:flutter/material.dart';
import 'package:visa_arapiraca_app/presentation/widgets/forms/formfield_parecer.dart';
import 'package:visa_arapiraca_app/presentation/widgets/termos/Controllers/parecerTecnico_controller.dart';

class AnaliseTecnicaForm extends StatefulWidget {
  final ParecerTecnicoController controller;
  const AnaliseTecnicaForm({
    required this.controller,
    super.key
  });

  @override
  State<AnaliseTecnicaForm> createState() => _AnaliseTecnicaFormState();
}

class _AnaliseTecnicaFormState extends State<AnaliseTecnicaForm> {
 
  late final analiseTecnicaController = widget.controller;

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Análise Técnica" , style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
        const SizedBox(height: 30),
        
        SizedBox(
          height: 200,
          child: TextFormField(
            controller: analiseTecnicaController.parecerController,
            maxLines: null,
            expands: true,
            keyboardType: TextInputType.multiline,
            textAlignVertical: TextAlignVertical.top,
            decoration: InputDecoration(
              labelText: "Análise Técnica",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              border: OutlineInputBorder(),
            ),
            validator: (value) => null,
          ),
        ),

        const SizedBox(height: 20),
        Row(
        children: [
          Expanded(
            flex: 1,
            child: FormfieldParecer(
              fieldTitle: "Fiscal Responsável", 
              fieldController: analiseTecnicaController.informacaoFiscal.nomeFiscal,
              
            )
          ),
          SizedBox(width: 25),
          Expanded(
            flex: 1,
            child: FormfieldParecer(
              fieldTitle: "Matricula do Fiscal", 
              fieldController: analiseTecnicaController.informacaoFiscal.matriculaFiscal,
            )
          ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: FormfieldParecer(
                fieldTitle: "Taxa do Alvará",
                fieldController: analiseTecnicaController.taxaAlvaraController,
                prefix: "R\$",
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: FormfieldParecer(
                fieldTitle: "Validade do Alvará",
                fieldController: analiseTecnicaController.validadeAlvaraController,
              ),
            ),
          ],
        ),
        
      ],
    );
  }
}