import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:visa_arapiraca_app/core/utils/form_masks.dart';
import 'package:visa_arapiraca_app/core/utils/form_validators.dart';

class FormfieldCpfcnpj extends StatefulWidget {
  final TextEditingController? controller;
  const FormfieldCpfcnpj({super.key, this.controller});

  @override
  State<FormfieldCpfcnpj> createState() => _FormfieldCpfcnpjState();
}

class _FormfieldCpfcnpjState extends State<FormfieldCpfcnpj> {

  late MaskTextInputFormatter maskFormatter;

  @override
  void initState() {
    super.initState();
    maskFormatter = MaskTextInputFormatter(
      mask: '###.###.###-##', // Inicialmente CPF
      filter: {"#": RegExp(r'[0-9]')},
    );
  }

  void _updateMask(String value) {
    String numericValue = value.replaceAll(RegExp(r'[^0-9]'), '');
    print(numericValue.length);
    setState(() {
      if (numericValue.length < 11) {
        maskFormatter.updateMask(mask: '###.###.###-##');
      } else {
        maskFormatter.updateMask(mask: '##.###.###/####-##');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'CPF/CNPJ',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(),
      ),
      inputFormatters: [maskFormatter],
      readOnly: false,
      validator: (value) => validarCpfCnpj("CPF ou CNPJ", value),
      controller: widget.controller,
      onChanged: _updateMask,
    );
  }
}