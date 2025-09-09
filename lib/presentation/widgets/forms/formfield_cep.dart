import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:visa_arapiraca_app/core/utils/form_masks.dart';
import 'package:visa_arapiraca_app/core/utils/form_validators.dart';

class FormfieldCEP extends StatefulWidget {
  final TextEditingController? controller;
  final VoidCallback? onFieldLostFocus;
  const FormfieldCEP({super.key, this.controller, this.onFieldLostFocus});

  @override
  State<FormfieldCEP> createState() => _FormfieldCEPState();
}

class _FormfieldCEPState extends State<FormfieldCEP> {

  late MaskTextInputFormatter maskFormatter;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    maskFormatter = cepMask;

    _focusNode = FocusNode();
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        // Quando perder foco, chama a função externa
        if (widget.onFieldLostFocus != null) {
          widget.onFieldLostFocus!();
        }
      }
    });
  }
    @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
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
      focusNode: _focusNode,                                                                                   
    );
  }
}