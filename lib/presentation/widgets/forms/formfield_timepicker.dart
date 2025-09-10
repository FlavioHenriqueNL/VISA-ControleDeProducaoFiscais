import 'package:flutter/material.dart';

class FormfieldTimepicker extends StatelessWidget {
  
  final String fieldTitle;
  final TextEditingController fieldController;
  final String? Function(String?)? validator;

  const FormfieldTimepicker({
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
        final TimeOfDay? horaSelecionada = await showTimePicker(context: context, initialTime: TimeOfDay.now());
        if(horaSelecionada != null ){
          final formattedTime = 
            "${horaSelecionada.hour.toString().padLeft(2,'0')}:${horaSelecionada.minute.toString().padLeft(2,'0')}";
        fieldController.text = formattedTime;        
        }
      },
    );
  }
}   
  
