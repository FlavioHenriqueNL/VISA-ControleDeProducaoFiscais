import 'package:flutter/material.dart';
import 'package:visa_arapiraca_app/presentation/widgets/ParecerSanitario/Preview/VisualizarDocumento.dart';
import 'package:visa_arapiraca_app/presentation/widgets/Termos/Formulario/termoInspecao_formWidget.dart';
import 'package:visa_arapiraca_app/presentation/widgets/Termos/Controllers/termodeinspecaoController.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: TermoinspecaoFormwidget(controller: TermoInspecaoController())
      ),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: const[
        Locale('pt', 'BR')
      ]
    ),
  );
}
