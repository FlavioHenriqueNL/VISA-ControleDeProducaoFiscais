import 'package:flutter/material.dart';
import 'package:visa_arapiraca_app/home.dart';
import 'package:visa_arapiraca_app/login.dart';
import 'package:visa_arapiraca_app/pages/producao/producao_diaria.dart';
import 'package:visa_arapiraca_app/teste_responsivo.dart';
import 'package:visa_arapiraca_app/widgets/producao_criar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});


  @override
  Widget build(BuildContext context){
    return MaterialApp(
     title: "Meu primeiro app flutter",
     home: TesteResponsivo(),
    );
  }
}
