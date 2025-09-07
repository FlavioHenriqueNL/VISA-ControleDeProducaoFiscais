import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:visa_arapiraca_app/core/utils/form_masks.dart';
import 'package:visa_arapiraca_app/core/utils/form_validators.dart';

class FormfieldCEP extends StatefulWidget {
  final TextEditingController? controller;
  const FormfieldCEP({super.key, this.controller});

  @override
  State<FormfieldCEP> createState() => _FormfieldCEPState();
}

class _FormfieldCEPState extends State<FormfieldCEP> {

  late MaskTextInputFormatter maskFormatter;

  @override
  void initState() {
    super.initState();
    maskFormatter = cepMask;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'CEP',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(),
      ),
      inputFormatters: [maskFormatter],
      readOnly: false,
      validator: (value) => validarCEP("CEP", value),
      controller: widget.controller,
    );
  }
}