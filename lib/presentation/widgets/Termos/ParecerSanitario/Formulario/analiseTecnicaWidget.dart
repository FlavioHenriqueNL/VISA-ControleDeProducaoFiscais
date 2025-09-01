  import 'package:flutter/material.dart';
import 'package:visa_arapiraca_app/presentation/widgets/Termos/Componentes/formfield_parecer.dart';
import 'package:visa_arapiraca_app/presentation/widgets/Termos/Controllers/AnaliseTecnicaController.dart';

class AnaliseTecnicaForm extends StatefulWidget {
  const AnaliseTecnicaForm({super.key});

  @override
  State<AnaliseTecnicaForm> createState() => _AnaliseTecnicaFormState();
}

class _AnaliseTecnicaFormState extends State<AnaliseTecnicaForm> {
  final _formKey = GlobalKey<FormState>();
  final analiseTecnicaController = AnaliseTecnicaController();
  @override
  Widget build(BuildContext context) {

    return Form(
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(height: 30),
          const Text("Análise Técnica"),
          const SizedBox(height: 30),
          
          FormfieldParecer(
            fieldTitle: "Parecer técnico", 
            fieldController: analiseTecnicaController.parecerController, 
            validator: (value) => null
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: FormfieldParecer(
                  fieldTitle: "Taxa do Alvará",
                  fieldController: analiseTecnicaController.taxaAlvaraController,
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
          )
        ],
      ),
    );
  }
}