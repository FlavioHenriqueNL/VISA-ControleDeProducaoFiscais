import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:visa_arapiraca_app/core/utils/form_masks.dart';
import 'package:visa_arapiraca_app/core/utils/form_validators.dart';

class FormfieldCpfcnpj extends StatefulWidget {
  final TextEditingController? controller;
  final String? title;
  final VoidCallback? onFieldLostFocus; // <-- função chamada ao perder foco
  final InputDecoration? decoration;

  const FormfieldCpfcnpj({
    super.key,
    this.controller,
    this.title,
    this.onFieldLostFocus,
    this.decoration
  });

  @override
  State<FormfieldCpfcnpj> createState() => _FormfieldCpfcnpjState();
}

class _FormfieldCpfcnpjState extends State<FormfieldCpfcnpj> {
  late MaskTextInputFormatter maskFormatter;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    maskFormatter = cpfMask;

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

  void _updateMask(String value) {
    String numericValue = value.replaceAll(RegExp(r'[^0-9]'), '');
    setState(() {
      if (numericValue.length < 11) {
        maskFormatter.updateMask(mask: cpfMask.getMask());
      } else {
        maskFormatter.updateMask(mask: cnpjMask.getMask());
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
      decoration: widget.decoration ?? InputDecoration(
        labelText: widget.title ?? "CPF / CNPJ",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: const OutlineInputBorder(),
      ),
      inputFormatters: [maskFormatter],
      readOnly: false,
      validator: (value) => validarCpfCnpj("CPF ou CNPJ", value),
      controller: widget.controller,
      focusNode: _focusNode, // <-- adiciona o FocusNode
      onChanged: _updateMask,
    );
  }
}