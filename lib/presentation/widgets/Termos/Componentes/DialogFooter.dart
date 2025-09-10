import 'package:flutter/material.dart';

class DialogFooter extends StatelessWidget {
  final VoidCallback salvar;

  const DialogFooter({required this.salvar, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton.icon(
            style: cancelButtonStyle,
            onPressed: () => Navigator.of(context).pop(),
            label: Text("Cancelar", style: TextStyle(fontSize: 16)),
            icon: Icon(Icons.cancel_rounded, color: Colors.white, size: 20),
          ),

          SizedBox(width: 20),

          ElevatedButton.icon(
            style: cleanButtonStyle,
            onPressed: () => Navigator.of(context).pop(),
            label: Text("Limpar", style: TextStyle(fontSize: 16)),
            icon: Icon(Icons.cleaning_services, color: Colors.white, size: 20),
          ),

          SizedBox(width: 20),
          ElevatedButton.icon(
            style: saveButtonStyle,
            onPressed: salvar,
            label: Text("Salvar Alterações", style: TextStyle(fontSize: 16)),
            icon: Icon(Icons.save, color: Colors.white, size: 20),
          ),
        ],
      ),
    );
  }
}

// Styles
final dialogFooterButtonStyle = ElevatedButton.styleFrom(
  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
);

final cancelButtonStyle = dialogFooterButtonStyle.copyWith(
  backgroundColor: WidgetStatePropertyAll(Colors.red),
  foregroundColor: WidgetStatePropertyAll(Colors.white),
);

final saveButtonStyle = dialogFooterButtonStyle.copyWith(
  backgroundColor: WidgetStatePropertyAll(Colors.green),
  foregroundColor: WidgetStatePropertyAll(Colors.white),
);

final cleanButtonStyle = dialogFooterButtonStyle.copyWith(
  backgroundColor: WidgetStatePropertyAll(Colors.yellow.shade600),
  foregroundColor: WidgetStatePropertyAll(Colors.white),
);
