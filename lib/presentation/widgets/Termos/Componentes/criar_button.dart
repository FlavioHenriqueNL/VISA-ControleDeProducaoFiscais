import 'package:flutter/material.dart';

class ButtonCriarTermo extends StatelessWidget {

  final String label;
  final VoidCallback onPressedAction;


  const ButtonCriarTermo({
    required this.label,
    required this.onPressedAction,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressedAction,
      icon: Icon(Icons.add_box_outlined, color: Colors.white),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        textStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
    );
  }
}