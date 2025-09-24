import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:visa_arapiraca_app/domain/entities/termoInspecao.dart';
import 'package:visa_arapiraca_app/presentation/widgets/termos/Componentes/stack_container.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class InfoTermoInspecao extends StatelessWidget {
  final TermoInspecao termo;
  final DateTime dataInspecaoCompleta;
  

  InfoTermoInspecao({
    required this.termo,
    super.key
  }): dataInspecaoCompleta = termo.dataCompleta;

  String get dia => DateFormat("dd").format(dataInspecaoCompleta);
  String get mes => DateFormat("MMMM", "pt_BR").format(dataInspecaoCompleta);
  String get ano => DateFormat("yyyy").format(dataInspecaoCompleta);
  String get hora => DateFormat("HH:mm").format(dataInspecaoCompleta);

 
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StackContainer(title: "Fato da ação", 
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Aos $dia do mês de $mes do ano de $ano, às $hora, no exercício da FISCALIZAÇÃO SANITÁRIA, foi realizado inspeção em ${termo.objetoInspecao} constatamos o seguinte:",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              Text(termo.fatoInspecao, style: TextStyle(fontSize: 16), textAlign: TextAlign.justify,),
            ],
          )
        ),
        SizedBox(height: 25,),

        StackContainer(title: "Fatos e decisões fundamentadas nos seguintes dispositivos legais e/ou regulamentos:", 
          child: termo.fundamentosLegais.isEmpty ? Text("Nenhum fundamento legal registrado") : Text(termo.fundamentosLegais, style: TextStyle(fontSize: 16)),
        )
      ],
    );
  }
}