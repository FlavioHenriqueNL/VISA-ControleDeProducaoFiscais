import 'package:flutter/material.dart';
import 'package:visa_arapiraca_app/presentation/widgets/ParecerSanitario/Preview/VisualizarDocumento.dart';
import 'package:visa_arapiraca_app/presentation/widgets/Termos/Formulario/termoInspecao_formWidget.dart';
import 'package:visa_arapiraca_app/presentation/widgets/forms/formControllers/termodeinspecaoController.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: TermoinspecaoFormwidget(controller: Termodeinspecaocontroller())
      ),
    ),
  );
}
