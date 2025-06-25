import 'package:flutter/material.dart';
import 'package:visa_arapiraca_app/models/cnaes/cnaes_model.dart';


class CnaeDataSource extends DataTableSource {
  final List<Cnaes> cnaes;

  CnaeDataSource(this.cnaes);

  @override
  DataRow? getRow(int index) {
    if (index >= cnaes.length) return null;

    final cnae = cnaes[index];
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text(cnae.codigo)),
        DataCell(Text(cnae.descricao)),
        DataCell(Text(cnae.nivelRisco)),
        DataCell(Text(cnae.pbaObrigatorio ? "SIM" : "NÃO")),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => cnaes.length;

  @override
  int get selectedRowCount => 0;
}
