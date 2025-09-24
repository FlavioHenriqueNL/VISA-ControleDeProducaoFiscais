import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:visa_arapiraca_app/domain/entities/notificacao.dart';

import 'package:visa_arapiraca_app/presentation/widgets/termos/Componentes/stack_container.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class CorpoTermoNotificacao extends StatelessWidget {
  final Notificacao termo;
  final DateTime dataInspecaoCompleta;
  

  CorpoTermoNotificacao({
    required this.termo,
    super.key
  }): dataInspecaoCompleta = termo.dataEmissao;

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
                "Aos $dia do mês de $mes do ano de $ano, às $hora, no exercício da FISCALIZAÇÃO SANITÁRIA, Pela presente fica notificada a pessoa fisica ou jurídica supracidada, para proceder até ${termo.prazo} a cumprir as seguintes obrigações:",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              Text(termo.exigencias, style: TextStyle(fontSize: 16), textAlign: TextAlign.justify,),
            ],
          )
        ),
        SizedBox(height: 25,),

        StackContainer(title: "Fatos e decisões fundamentadas nos seguintes dispositivos legais e/ou regulamentos:", 
          child: termo.fundamentoLegal.isEmpty ? Text("Nenhum fundamento legal registrado") : Text(termo.fundamentoLegal, style: TextStyle(fontSize: 16)),
        )
      ],
    );
  }
}