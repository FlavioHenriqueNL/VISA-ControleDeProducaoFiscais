import 'package:flutter/material.dart';
import 'package:visa_arapiraca_app/models/producao/producao_model.dart';
import 'package:visa_arapiraca_app/widgets/producao/producao_criacao_field.dart';
import 'package:visa_arapiraca_app/widgets/producao/producao_criacao_notificacoes_fields.dart';

class CriarProducao extends StatefulWidget {
  final Producao producao;

  const CriarProducao({super.key, required this.producao});

  @override
  State<CriarProducao> createState() => _CriarProducaoState();
}

class _CriarProducaoState extends State<CriarProducao> {
  late Producao itemProducao;
  late TextEditingController numeroInspecoes;
  late TextEditingController numeroPareceres;
  late TextEditingController numeroDenuncias;
  late TextEditingController numeroNotificacoes;
  late TextEditingController numeroAutosInfracao;
  late TextEditingController numeroInterdicoes;
  late TextEditingController numeroApreensoes;

	void producaoListener<T>({
		required TextEditingController producaoController,
		required List<T> Function() getList,
		required void Function(List<T>) setList,
		required T Function() createEmptyItem,
		required void Function(VoidCallback) setStateCallback 
	}){
		producaoController.addListener((){
			final quantidade = int.tryParse(producaoController.text) ?? 0;
			setStateCallback((){
				final listaAtual = getList();
				final quantidadeAtual = listaAtual.length;
				if(quantidade > quantidadeAtual){
					final novosItens = List.generate(quantidade - quantidadeAtual, (_) => createEmptyItem());
					setList([...listaAtual, ...novosItens]);
				}else if(quantidade < quantidadeAtual){
					setList(listaAtual.sublist(0, quantidade));
				}
			});
		});
	}

	

  @override
  void initState() {
    super.initState();
    itemProducao = widget.producao;
    itemProducao.notificacoes = List.of(itemProducao.notificacoes);
    numeroInspecoes = TextEditingController(
      text: itemProducao.inspecoes?.toString() ?? "",
    );
    numeroPareceres = TextEditingController(
      text: itemProducao.pareceres?.toString() ?? "",
    );
    numeroDenuncias = TextEditingController(
      text: itemProducao.denuncias?.toString() ?? "",
    );
    numeroNotificacoes = TextEditingController(
      text: itemProducao.notificacoes.length.toString(),
    );
    numeroAutosInfracao = TextEditingController(
			text: itemProducao.autosInfracao.length.toString(),
		);
    numeroInterdicoes = TextEditingController(
			text: itemProducao.interdicoes.length.toString(),
		);
    numeroApreensoes = TextEditingController(
			text: itemProducao.apreensoes.length.toString(),
		);

		producaoListener<Notificacoes>(
			producaoController: numeroNotificacoes, 
			getList: () => itemProducao.notificacoes, 
			setList: (novaListaNotificacoes) => itemProducao.notificacoes = novaListaNotificacoes, 
			createEmptyItem: () => Notificacoes(cnpj: "", razaoSocial: "", motivo: ""), 
			setStateCallback: setState
		);
		producaoListener<Notificacoes>(
			producaoController: numeroAutosInfracao, 
			getList: () => itemProducao.autosInfracao, 
			setList: (novaListaAutosInfracao) => itemProducao.autosInfracao = novaListaAutosInfracao, 
			createEmptyItem: () => Notificacoes(cnpj: "", razaoSocial: "", motivo: ""), 
			setStateCallback: setState
		);
		producaoListener<Notificacoes>(
			producaoController: numeroInterdicoes, 
			getList: () => itemProducao.interdicoes, 
			setList: (novaListaInterdicoes) => itemProducao.interdicoes = novaListaInterdicoes, 
			createEmptyItem: () => Notificacoes(cnpj: "", razaoSocial: "", motivo: ""), 
			setStateCallback: setState
		);
		producaoListener<Apreensoes>(
			producaoController: numeroInterdicoes, 
			getList: () => itemProducao.apreensoes, 
			setList: (novaListaInterdicoes) => itemProducao.interdicoes = novaListaInterdicoes, 
			createEmptyItem: () => Apreensoes(cnpj: "", razaoSocial: "", motivo: "", itensApreendidos: ""), 
			setStateCallback: setState
		);

	}

  @override
  void dispose() {
    numeroInspecoes.dispose();
    numeroPareceres.dispose();
    numeroDenuncias.dispose();
    numeroNotificacoes.dispose();
    numeroAutosInfracao.dispose();
    numeroInterdicoes.dispose();
    numeroApreensoes.dispose();
    super.dispose();
  }

  void salvar() {
    setState(() {
      //TODO: Verificar se houve realmente um cadastro para ser preenchido (a produção não pode ser completamente zerada);
      //TODO: Verificação se existe alguma notificação ou apreensão que não foi preenchida e impedir salvamento;
      //VERSÃO INICIAL APENAS PARA PRIMEIRAS IMPRESSÕES.
      itemProducao.inspecoes = int.tryParse(numeroInspecoes.text) ?? 0;
      itemProducao.pareceres = int.tryParse(numeroPareceres.text) ?? 0;
      itemProducao.denuncias = int.tryParse(numeroDenuncias.text) ?? 0;

      // Quantidade de notificações e apreensões é implícita na lista, não atribui diretamente.

      Navigator.of(context).pop(itemProducao);      
    });
  }

  @override
  Widget build(BuildContext context) {
    final largura = MediaQuery.of(context).size.width * 0.9;
    final altura = MediaQuery.of(context).size.height * 0.9;

    return Dialog(
      insetPadding: EdgeInsets.all(16),
      child: Container( width: largura, height: altura, padding: EdgeInsets.all(24),
        child: Column(
          children: [
            // Cabeçalho com botão de fechar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Cadastrar Produção",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                IconButton(icon: Icon(Icons.close), onPressed: () => Navigator.of(context).pop()),
              ],
            ),
            Divider(),
            // Conteúdo com scroll
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //INSPEÇÕES
                    FieldProducao(
											titulo: "Número de Inspeções:", 
											controller: numeroInspecoes
										),
                    SizedBox(height: 15),
                    
										//PARECERES
                    FieldProducao(
											titulo: "Número de Pareceres:", 
											controller: numeroPareceres
										),
                    SizedBox(height: 15),

                    //DENÚNCIAS
                    FieldProducao(
											titulo: "Denúncias Apuradas:", 
											controller: numeroDenuncias
										),

										//NOTIFICAÇÕES
                    FieldAccordion(
											fieldTitle: "Notificações:", 
											controller: numeroNotificacoes, 
											notificacaoTypeList: itemProducao.notificacoes, 
											accordionTitle: (i) => "Empresa Notificada: ${i+1}"
										),

										//AUTOS DE INFRAÇÃO
										FieldAccordion(
											fieldTitle: "Autos de Infração:", 
											controller: numeroAutosInfracao, 
											notificacaoTypeList: itemProducao.autosInfracao, 
											accordionTitle: (i) => "Empresa Autuada: ${i+1}"
										),              
              
                    FieldAccordion(
											fieldTitle: "Interdições:", 
											controller: numeroInterdicoes, 
											notificacaoTypeList: itemProducao.interdicoes, 
											accordionTitle: (i) => "Empresa Interditada: ${i+1}"
										),

                    SizedBox(height: 15),
                    Divider(height: 1),
                    SizedBox(height: 15),

                    FieldProducao(
											titulo: "Apreensões:", 
											controller: numeroApreensoes
										),

                    SizedBox(height: 15),
                    Divider(height: 1),
                    SizedBox(height: 15),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24),
            // Botões de ação
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text("Cancelar"),
                ),
                SizedBox(width: 8),
                TextButton(
                  onPressed: () => print(itemProducao.toJson()),
                  child: Text("Mostrar Objeto"),
                ),
                SizedBox(width: 8),
                ElevatedButton(onPressed: salvar, child: Text("Salvar Objeto")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
