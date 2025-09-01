import 'package:flutter/material.dart';

class TituloSecaoPareceres extends StatelessWidget {
  final String title;
  const TituloSecaoPareceres({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 20,
      top: -12, // pode ajustar para alinhar melhor
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[700],
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}