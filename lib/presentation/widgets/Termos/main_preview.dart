import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:visa_arapiraca_app/presentation/widgets/termos/Preview/cabecalho_documento.dart';
// import 'package:visa_arapiraca_app/presentation/widgets/termos/Preview/assinaturas_termo.dart';
// import 'package:visa_arapiraca_app/presentation/widgets/termos/Preview/info_termoInspecao.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            // InfoTermoInspecao(),
            // AssinaturasTermo()
            CabecalhoDocumento(),
            // Text("Nada para ser mostrado.")
          ],
        )
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
