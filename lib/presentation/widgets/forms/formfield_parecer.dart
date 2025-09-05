import 'package:flutter/material.dart';

class FormfieldParecer extends StatelessWidget {
  final bool? readOnly;
  final String fieldTitle;
  final TextEditingController fieldController;
  final String? Function(String?)? validator;

  const FormfieldParecer({
    this.readOnly,
    required this.fieldTitle,
    required this.fieldController,
    this.validator,
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
      ),
      validator: validator,
      readOnly: readOnly ?? false,
    );
  }
}
