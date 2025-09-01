import 'package:flutter/material.dart';

class IdentificacaoField extends StatefulWidget {

  final String field;
  final String? value;

  const IdentificacaoField({
    super.key,
    required this.field,
    this.value,
  });

  @override
  State<IdentificacaoField> createState() => _IdentificacaoFieldState();
}

class _IdentificacaoFieldState extends State<IdentificacaoField> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(widget.field, style: TextStyle(fontSize: 18)),
        SizedBox(width: 10),
        Text(widget.value ?? "", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ],
    );
  }
}