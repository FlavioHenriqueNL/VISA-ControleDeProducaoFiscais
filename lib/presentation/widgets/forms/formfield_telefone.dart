import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:visa_arapiraca_app/core/utils/form_masks.dart';
import 'package:visa_arapiraca_app/core/utils/form_validators.dart';

class FormfieldTelefone extends StatefulWidget {
  final TextEditingController? controller;
  const FormfieldTelefone({super.key, this.controller});

  @override
  State<FormfieldTelefone> createState() => _FormfieldTelefoneState();
}

class _FormfieldTelefoneState extends State<FormfieldTelefone> {

  late MaskTextInputFormatter maskFormatter;

  @override
  void initState() {
    super.initState();
    maskFormatter = telefoneFixoMask;
  }

  void _updateMask(String value) {
    String numericValue = value.replaceAll(RegExp(r'[^0-9]'), '');
    setState(() {
      if (numericValue.length < 10) {
        maskFormatter.updateMask(mask: telefoneFixoMask.getMask());
      } else {
        maskFormatter.updateMask(mask: telefoneMask.getMask());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Telefone para contato',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(),
      ),
      inputFormatters: [maskFormatter],
      readOnly: false,
      validator: (value) => validarTelefone("Telefone", value),
      controller: widget.controller,
      onChanged: _updateMask,
    );
  }
}