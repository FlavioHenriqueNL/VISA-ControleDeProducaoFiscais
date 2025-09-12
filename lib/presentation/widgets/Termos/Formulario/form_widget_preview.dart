import 'package:flutter/material.dart';
import 'package:visa_arapiraca_app/presentation/widgets/termos/Controllers/parecerTecnico_controller.dart';
import 'package:visa_arapiraca_app/presentation/widgets/termos/Formulario/analiseTecnicaWidget.dart';

void main() {
  
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: 
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: GlobalKey<FormState>(),
              child: AnaliseTecnicaForm(
                controller: ParecerTecnicoController(),
              ),
            )
          ),
        ),
      ),
    ),
  );
}
