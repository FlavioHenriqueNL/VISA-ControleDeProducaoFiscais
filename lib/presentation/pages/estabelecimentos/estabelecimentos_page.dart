import 'package:flutter/material.dart';
import 'package:visa_arapiraca_app/data/repositories/estabelecimento_firestore_repository.dart';
import 'package:visa_arapiraca_app/domain/entities/estabelecimento.dart';
import 'package:visa_arapiraca_app/domain/useCases/estabelecimento/getEstabelecimento.dart';
import 'package:visa_arapiraca_app/presentation/widgets/Componentes/scrollable_page.dart';
import 'package:visa_arapiraca_app/presentation/widgets/componentes/dashboard_body.dart';
import 'package:visa_arapiraca_app/presentation/widgets/forms/formfield_cpfCnpj.dart';
import 'package:visa_arapiraca_app/presentation/widgets/termos/Componentes/criar_button.dart';

class EstabelecimentosPage extends StatefulWidget {
  const EstabelecimentosPage({super.key});

  @override
  State<EstabelecimentosPage> createState() => _EstabelecimentosPageState();
}

class _EstabelecimentosPageState extends State<EstabelecimentosPage> {

  TextEditingController cnpjController = TextEditingController();

  late List<Estabelecimento> estabelecimentos;

  void buscarEstabelecimento(String cnpj) {
    // Lógica para buscar o estabelecimento pelo CNPJ
  final busca = GetEstabelecimento(EstabelecimentoFirestoreRepository());
  cnpj = cnpj.replaceAll(RegExp(r'[^0-9]'), ''); // Remove caracteres não numéricos
  

   busca.all(cnpj).then((result) {
      setState(() {
        estabelecimentos = result ?? [];
      });
    }).catchError((error) {
      // Tratar erros de busca
      print("Erro ao buscar estabelecimento: $error");
    });
  }

  @override
  void initState() {
    estabelecimentos = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return 
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: FormfieldCpfcnpj(title: "CPF ou CNPJ do Estabelecimento", controller: cnpjController,)),
                SizedBox(width: 20,),
                ButtonCriarTermo(label: "Buscar", onPressedAction: () => buscarEstabelecimento(cnpjController.text),)
              ],
            ),

            SizedBox(height: 60),
            estabelecimentos.isEmpty
    ? Padding(
        padding: const EdgeInsets.only(top: 100.0),
        child: Center(
          child: Text(
            "Nenhum estabelecimento encontrado. Utilize o campo acima para buscar por CPF ou CNPJ.",
            style: TextStyle(fontSize: 16, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ),
      )
    : Expanded(
        child: ListView.builder(
          itemCount: estabelecimentos.length,
          itemBuilder: (context, index) {
            final estabelecimento = estabelecimentos[index];
            return ListTile(
              title: Text(estabelecimento.nomeFantasia ?? ''),
              subtitle: Text("CNPJ: ${estabelecimento.cpfCnpj}"),
              onTap: () {
                // Ação ao selecionar um estabelecimento
              },
            );
          },
        ),
      ),
          ],
        );
      
  }
}