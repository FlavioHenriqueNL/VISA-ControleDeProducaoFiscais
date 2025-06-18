import 'package:flutter/material.dart';
import 'package:visa_arapiraca_app/models/producao/producao_model.dart';
import 'package:visa_arapiraca_app/widgets/accordion.dart';
import 'package:visa_arapiraca_app/widgets/producao_criar.dart';
import 'package:visa_arapiraca_app/widgets/table_notificados.dart';
import 'package:visa_arapiraca_app/widgets/visa_app_bar.dart';
import 'package:intl/intl.dart';

class ProducaoDiaria extends StatefulWidget {
  const ProducaoDiaria({super.key});

  @override
  State<ProducaoDiaria> createState() => _ProducaoDiariaState();
}

class _ProducaoDiariaState extends State<ProducaoDiaria> {

  late List<Producao> producoesTeste;

  @override
  void initState() {
    producoesTeste = [
      Producao(
        dataInspecao: DateTime(2025, 6, 1),
        inspecoes: 3,
        denuncias: 1,
        pareceres: 0,
        notificacoes: [
          Notificacoes(
            cnpj: '12.345.678/0001-90',
            razaoSocial: 'Comercial São Jorge Ltda.',
            motivo: 'Ausência de alvará de funcionamento'
          ),
        ],
        autosInfracao: [],
        interdicoes: [],
        apreensoes: []
      ),
      Producao(
        dataInspecao: DateTime(2025, 6, 5),
        inspecoes: 5,
        denuncias: 0,
        pareceres: 2,
        notificacoes: [],
        autosInfracao: [
          Notificacoes(
            cnpj: '23.456.789/0001-01',
            razaoSocial: 'Supermercado Real',
            motivo: 'Comercialização de produtos vencidos'
          ),
          Notificacoes(
            cnpj: '98.765.432/0001-55',
            razaoSocial: 'Mercado Popular Ltda.',
            motivo: 'Ausência de boas práticas de higiene'
          ),
        ],
        interdicoes: [],
        apreensoes: []
      ),
      Producao(
        dataInspecao: DateTime(2025, 6, 10),
        inspecoes: 2,
        denuncias: 1,
        pareceres: 1,
        notificacoes: [],
        autosInfracao: [],
        interdicoes: [
          Notificacoes(
            cnpj: '34.567.890/0001-22',
            razaoSocial: 'Padaria do Bairro',
            motivo: 'Contaminação cruzada entre alimentos crus e prontos'
          ),
        ],
        apreensoes: []
      ),
      Producao(
        dataInspecao: DateTime(2025, 6, 15),
        inspecoes: 4,
        denuncias: 2,
        pareceres: 3,
        notificacoes: [],
        autosInfracao: [],
        interdicoes: [],
        apreensoes: [
          Apreensoes(
            cnpj: '56.789.012/0001-44',
            razaoSocial: 'Frigorífico Central',
            motivo: 'Estocagem de carnes fora da temperatura recomendada',
            itensApreendidos: '20kg de carne bovina resfriada, 15kg de linguiça calabresa, 10kg de frango congelado.'
          ),
          Apreensoes(
            cnpj: '87.654.321/0001-77',
            razaoSocial: 'Distribuidora de Alimentos Norte Ltda.',
            motivo: 'Produtos armazenados com pragas visíveis',
            itensApreendidos: '50kg de arroz, 25kg de feijão, 30 latas de milho verde.'
          ),
        ]
      ),
      Producao(
        dataInspecao: DateTime(2025, 6, 20),
        inspecoes: 0,
        denuncias: 0,
        pareceres: 0,
        notificacoes: [],
        autosInfracao: [],
        interdicoes: [],
        apreensoes: []
      ),
    ];

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VisaAppBar(title: "Produções"),
      body: 
        SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Produção Diária", style: TextStyle(fontSize: 28),),
                  ElevatedButton(
                    onPressed: 
                      ()async {
                        final novaProducao = await showDialog<Producao>(
                          context: context, 
                          builder: (context) => CriarProducao(producao: Producao(dataInspecao: DateTime.now())));
                        if(novaProducao != null){
                          print(novaProducao.toJson());
                          setState(() {
                            producoesTeste.add(novaProducao);
                          });
                        }
                      } , 
                    child: Text("Criar")
                  )
                ],
              ),
              SizedBox(height: 25,),
              
              Text("Últimas produções", style: TextStyle(fontSize: 18)),

              Accordion<Producao>(
                data: producoesTeste,
                headerBuilder: (context, producao, isExpanded) {
                  return ListTile(
                    title: Text('Produção enviada em: ${DateFormat('dd/MM/yyyy').format(producao.dataInspecao.toLocal())}'),
                    subtitle: Text('Inspeções: ${producao.inspecoes}, Pareceres: ${producao.pareceres}, Denúncias: ${producao.denuncias}'),
                    
                  );
                },
                bodyBuilder: (context, producao) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (producao.notificacoes.isNotEmpty) ...[
                          Text('Notificações: ${producao.notificacoes.length}'),
                          const SizedBox(height: 8),
                          TableNotificados(listaEstabelecimentos: producao.notificacoes),
                        ],
                        if (producao.autosInfracao.isNotEmpty) ...[
                          Text('Autos de Infração: ${producao.autosInfracao.length}'),
                          const SizedBox(height: 8),
                          TableNotificados(listaEstabelecimentos: producao.autosInfracao),
                        ],
                        if (producao.interdicoes.isNotEmpty) ... [
                          Text('Interdições: ${producao.interdicoes.length}'),
                          const SizedBox(height: 8),
                          TableNotificados(listaEstabelecimentos: producao.interdicoes),
                        ],
                        if (producao.apreensoes.isNotEmpty) ... [
                          Text('Apreensões: ${producao.apreensoes.length}'),
                          const SizedBox(height: 8),
                          TableNotificados(listaEstabelecimentos: producao.apreensoes),
                        ]
                      ],
                    ),
                  );
                },
              ),
            ],
          )
        )
    );
  }
}