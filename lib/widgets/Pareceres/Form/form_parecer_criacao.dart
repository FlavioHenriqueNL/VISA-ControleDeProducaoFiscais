import 'package:flutter/material.dart';
import 'package:visa_arapiraca_app/core/utils/form_validators.dart';

class FormParecer extends StatefulWidget {
  const FormParecer({super.key});

  @override
  State<FormParecer> createState() => _FormParecerState();
}

class _FormParecerState extends State<FormParecer> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final TextEditingController numeroProcessoController =
        TextEditingController();

    return Form(
      key: _formKey,
      child: Column(
        /* 
          Número Processo, 
          CPF/CNPJ,
          Razão Social,
          Nome Fantasia,
          CEP, 
          Rua, Número, 
          Bairro, Cidade,
          Telefone, Email,
          Responsável Legal
          CPF Responsável, Código Conselho
        */
        children: [
          TextFormField(
            controller: numeroProcessoController,
            decoration: InputDecoration(
              labelText: 'Processo Nº',
              floatingLabelBehavior: FloatingLabelBehavior.always,
              border: OutlineInputBorder(),
            ),
            validator: (value) => campoVazio("Número do Processo", value),
          ),
        ],
      ),
    );
  }
}
