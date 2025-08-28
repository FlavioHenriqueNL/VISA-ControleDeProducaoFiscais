import 'package:flutter/material.dart';
import 'package:visa_arapiraca_app/data/repositories/cnae_repository.dart';
import 'package:visa_arapiraca_app/domain/entities/cnae.dart';
import 'package:visa_arapiraca_app/widgets/visa_app_bar.dart';

class CnaesPage extends StatefulWidget {
  const CnaesPage({super.key});

  @override
  State<CnaesPage> createState() => _CnaesPageState();
}

class _CnaesPageState extends State<CnaesPage> {

  List<Cnae> _cnaes = [];
  bool _loading = true;
  String? _error; 

  Future<void> _carregarCnaes() async {
    try{
      final listaCnaes = await CnaeRepository().carregarLocal();
      setState(() {
       _cnaes = listaCnaes;
      });
    }catch (e) {
      setState(() {
        _error = e.toString();
      });
    }finally{
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  void initState() {
    _carregarCnaes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    if(_loading){ return const Center(child: CircularProgressIndicator(),);}
    if(_error != null){ return Center(child: Text("Erro ao carregar a página $_error"),);}

    return Scaffold(
  appBar: VisaAppBar(title: "Lista de Cnaes"),
  body: SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: SizedBox(
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: DataTable(
          columns: const [
            DataColumn(label: Text("Código")),
            DataColumn(label: Text("Descrição")),
            DataColumn(label: Text("Nível Risco")),
            DataColumn(label: Text("PBA Obrigatório")),
          ],
          rows: _cnaes.map((cnae) {
            return DataRow(cells: [
              DataCell(Text(cnae.codigo)),
              DataCell(Text(cnae.descricao)),
              DataCell(Text(cnae.nivelRisco)),
              DataCell(Text(cnae.pbaObrigatorio ? "SIM" : "NÃO")),
            ]);
          }).toList(),
        ),
      ),
    ),
  ),
);

  }
}