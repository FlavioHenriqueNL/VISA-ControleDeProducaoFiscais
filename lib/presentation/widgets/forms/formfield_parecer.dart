import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class FormfieldParecer extends StatelessWidget {
  final bool? readOnly;
  final String fieldTitle;
  final TextEditingController fieldController;
  final String? Function(String?)? validator;
  final MaskTextInputFormatter? maskTextInputFormatter;
  final String? prefix;

  const FormfieldParecer({
    this.readOnly,
    required this.fieldTitle,
    required this.fieldController,
    this.validator,
    this.maskTextInputFormatter,
    this.prefix,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: fieldController,  
      decoration: InputDecoration(
        labelText: fieldTitle,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(),
        prefixText: prefix 
      ),
      validator: validator,
      readOnly: readOnly ?? false,
      inputFormatters: [maskTextInputFormatter ?? FilteringTextInputFormatter.singleLineFormatter],
    );
  }
}
