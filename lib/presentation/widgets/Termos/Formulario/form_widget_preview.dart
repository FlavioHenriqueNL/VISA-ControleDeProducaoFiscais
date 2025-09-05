import 'package:flutter/material.dart';
import 'package:visa_arapiraca_app/presentation/widgets/forms/formControllers/informacaoEstabelecimentoController.dart';
import 'package:visa_arapiraca_app/presentation/widgets/Termos/Formulario/identificacaoEstabelecimento.dart';

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
              child: IdentificacaoestabelecimentoFormWidget(
                controller: Informacaoestabelecimentocontroller(),
              ),
            )
          ),
        ),
      ),
    ),
  );
}
