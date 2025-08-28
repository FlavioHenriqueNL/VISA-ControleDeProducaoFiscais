import 'package:flutter/material.dart';
import '../../domain/entities/cnae.dart';



class CnaeDataSource extends DataTableSource {
  final List<Cnae> cnaes;

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
