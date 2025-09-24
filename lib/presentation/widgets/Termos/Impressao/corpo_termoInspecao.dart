import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:visa_arapiraca_app/domain/entities/termoInspecao.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:visa_arapiraca_app/presentation/widgets/termos/Componentes/stack_container_pdf.dart';

class PWInfoTermoInspecao extends pw.StatelessWidget {

  final TermoInspecao termo;
  final DateTime dataInspecaoCompleta;
  

  PWInfoTermoInspecao({
    required this.termo,
  }): dataInspecaoCompleta = termo.dataCompleta;

  String get dia => DateFormat("dd").format(dataInspecaoCompleta);
  String get mes => DateFormat("MMMM", "pt_BR").format(dataInspecaoCompleta);
  String get ano => DateFormat("yyyy").format(dataInspecaoCompleta);
  String get hora => DateFormat("HH:mm").format(dataInspecaoCompleta);

 
  @override
  pw.Widget build(pw.Context context) {
    return pw.Column(
      children: [
        PWStackContainer(title: "Fato da ação", 
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(
                "Aos $dia do mês de $mes do ano de $ano, às $hora, no exercício da FISCALIZAÇÃO SANITÁRIA, foi realizado inspeção em ${termo.objetoInspecao} constatamos o seguinte:",
                style: pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold),
              ),
              pw.Text(termo.fatoInspecao, style: pw.TextStyle(fontSize: 10), textAlign: pw.TextAlign.justify,),
            ],
          )
        ),
        pw.SizedBox(height: 10),

        PWStackContainer(title: "Fatos e decisões fundamentadas nos seguintes dispositivos legais e/ou regulamentos:", 
          child: termo.fundamentosLegais.isEmpty ? pw.Text("Nenhum fundamento legal registrado") : pw.Text(termo.fundamentosLegais, style: pw.TextStyle(fontSize: 10)),
        )
      ],
    );
  }
}