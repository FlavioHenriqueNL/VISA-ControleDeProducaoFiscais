import 'package:flutter/material.dart';

class FieldProducao extends StatefulWidget {
  final String titulo;
  final TextEditingController controller;

  const FieldProducao({
    super.key,
    required this.titulo,
    required this.controller,
  });

  @override
  State<FieldProducao> createState() => _FieldProducaoState();
}

class _FieldProducaoState extends State<FieldProducao> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(widget.titulo, style: TextStyle(fontSize: 18)),
        SizedBox(width: 16),
        SizedBox(
          width: 150,
          child: TextField(
            keyboardType: TextInputType.number,
            controller: widget.controller,
          ),
        ),
      ],
    );
  }
}
