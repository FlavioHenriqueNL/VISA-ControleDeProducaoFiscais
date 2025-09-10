import 'package:flutter/material.dart';

class FormfieldDatepicker extends StatelessWidget {
  
  final String fieldTitle;
  final TextEditingController fieldController;
  final String? Function(String?)? validator;

  const FormfieldDatepicker({
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
      readOnly: true,
      onTap: () async {
        final data = await showDatePicker(
          context: context, 
          firstDate: DateTime(2025), 
          lastDate: DateTime(2030)
        );
        if(data != null){
          fieldController.text = data.toString().split(" ")[0];
        }
      },
    );
  }
}   
  
