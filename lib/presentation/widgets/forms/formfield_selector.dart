import 'package:flutter/material.dart';

class FormfieldSelector extends StatefulWidget {
  
  final String fieldTitle;
  final TextEditingController fieldController;
  final String? Function(String?)? validator;
  final List<String> options;


  const FormfieldSelector({
    required this.fieldTitle,
    required this.fieldController,
    this.validator,
    required this.options,
    super.key
  });

  @override
  State<FormfieldSelector> createState() => _FormfieldSelectorState();
}

class _FormfieldSelectorState extends State<FormfieldSelector> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.fieldController,
      validator: widget.validator,
      decoration: InputDecoration(
        labelText: widget.fieldTitle,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(),
      ),
      readOnly: true,
      onTap: () async {
        final selecionado = await showModalBottomSheet<String>(          
          context: context,
          isScrollControlled: true, // permite controlar a altura
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),  // borda arredondada do modal
          ),
          builder: (context) {
            return Material(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.all(Radius.circular(16)), 
              
              child: ListView(
                shrinkWrap: true,
                children: widget.options.map((e) {
                  return ListTile(
                    contentPadding: EdgeInsets.all(25),
                    title: Text(e, style: TextStyle(fontSize: 24, color: Colors.white),),
                    onTap: () => Navigator.pop(context, e),
                  );
                }).toList(),
              ),
            );
          },
        );
        if (selecionado != null) {
          setState(() {
            widget.fieldController.text = selecionado;
          });
        }
      },
    );
  }
}
