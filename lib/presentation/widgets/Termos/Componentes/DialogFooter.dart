import 'package:flutter/material.dart';

class DialogFooter extends StatelessWidget {
  const DialogFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton.icon(
            style: ParecerBottomWidgetStyle.copyWith(
              backgroundColor: WidgetStateProperty.all<Color>(
                Colors.red,
              ),
              foregroundColor: WidgetStateProperty.all<Color>(
                Colors.white,
              ),
            ),
            onPressed: () => Navigator.of(context).pop(),
            label: Text("Cancelar", style: TextStyle(fontSize: 16)),
            icon: Icon(Icons.cancel_rounded,color: Colors.white,size: 20,
            ),
          ),

          SizedBox(width: 20),

          ElevatedButton.icon(
            style: ParecerBottomWidgetStyle.copyWith(
              backgroundColor: WidgetStateProperty.all<Color>(
                Colors.yellow.shade600,
              ),
              foregroundColor: WidgetStateProperty.all<Color>(
                Colors.white,
              ),
            ),
            onPressed: () => Navigator.of(context).pop(),
            label: Text("Limpar", style: TextStyle(fontSize: 16)),
            icon: Icon(Icons.cleaning_services,color: Colors.white,size: 20),
          ),

          SizedBox(width: 20),
          ElevatedButton.icon(
            style: ParecerBottomWidgetStyle.copyWith(
              backgroundColor: WidgetStateProperty.all<Color>(
                Colors.green,
              ),
              foregroundColor: WidgetStateProperty.all<Color>(
                Colors.white,
              ),
            ),
            onPressed: () {salvarParecer();},
            label: Text("Salvar Alterações",style: TextStyle(fontSize: 16)),
            icon: Icon(Icons.save, color: Colors.white, size: 20),
          ),
        ],
      ),
    );
  }
  // Styles
  
}