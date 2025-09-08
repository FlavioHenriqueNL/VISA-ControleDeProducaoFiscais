import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:visa_arapiraca_app/core/utils/form_validators.dart';

class FormfieldCnae extends StatefulWidget {
  final TextEditingController? controller;
  final String? title;
  final VoidCallback? onFieldLostFocus; // <-- função chamada ao perder foco

  const FormfieldCnae({
    super.key,
    this.controller,
    this.title,
    this.onFieldLostFocus,
  });

  @override
  State<FormfieldCnae> createState() => _FormfieldCnaeState();
}

class _FormfieldCnaeState extends State<FormfieldCnae> {
  late MaskTextInputFormatter maskFormatter;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
   
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
      decoration: InputDecoration(
        labelText: widget.title ?? "CNAE",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: const OutlineInputBorder(),
      ),
      
      readOnly: false,
      validator: (value) => campoVazio("Código CNAE", value),
      controller: widget.controller,
      focusNode: _focusNode, // <-- adiciona o FocusNode
    );
  }
}