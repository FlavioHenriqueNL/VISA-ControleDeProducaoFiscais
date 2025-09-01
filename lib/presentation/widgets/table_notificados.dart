import 'package:flutter/material.dart';
import 'package:visa_arapiraca_app/models/producao/producao_model.dart';

class TableNotificados extends StatefulWidget {

  final List<Notificacoes> listaEstabelecimentos;

  const TableNotificados({
    super.key, 
    required this.listaEstabelecimentos
  });

  @override
  State<TableNotificados> createState() => _TableNotificadosState();
}

class _TableNotificadosState extends State<TableNotificados> {

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          width: constraints.maxWidth,
          child: Table(
            border: TableBorder.all(),
            columnWidths: const <int, TableColumnWidth>{
              0: IntrinsicColumnWidth(), // CNPJ ocupa o mínimo necessário
              1: FlexColumnWidth(1),     // Ocupa metade do restante
              2: FlexColumnWidth(1),     // Ocupa metade do restante
            },
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              const TableRow(
                decoration: BoxDecoration(color: Colors.grey),
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("CNPJ", style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Razão Social", style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Motivo", style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              ...widget.listaEstabelecimentos.map((notificacao) => TableRow(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text( notificacao.cnpj, overflow: TextOverflow.ellipsis, maxLines: 1,),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(notificacao.razaoSocial,softWrap: true,),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(notificacao.motivo,softWrap: true,),
                  ),
                ],
              )),
            ],
          ),
        );
      },
    );
  }
}