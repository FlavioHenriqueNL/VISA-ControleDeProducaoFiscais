import 'package:flutter/material.dart';
import 'package:visa_arapiraca_app/presentation/widgets/Componentes/accordion.dart';
import 'package:visa_arapiraca_app/presentation/widgets/componentes/models/producao/producao_model.dart';
import 'package:visa_arapiraca_app/presentation/widgets/producao/producao_resumo.dart';
import 'package:visa_arapiraca_app/presentation/widgets/producao/producao_resumo_box_item.dart';
import 'package:visa_arapiraca_app/presentation/widgets/Componentes/producao_criar.dart';
import 'package:visa_arapiraca_app/presentation/widgets/Componentes/table_notificados.dart';
import 'package:intl/intl.dart';

class ProducaoPage extends StatefulWidget {
  const ProducaoPage({super.key});

  @override
  State<ProducaoPage> createState() => _ProducaoPageState();
}

class _ProducaoPageState extends State<ProducaoPage> {
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
            motivo: 'Ausência de alvará de funcionamento',
          ),
        ],
        autosInfracao: [],
        interdicoes: [],
        apreensoes: [],
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
            motivo: 'Comercialização de produtos vencidos',
          ),
          Notificacoes(
            cnpj: '98.765.432/0001-55',
            razaoSocial: 'Mercado Popular Ltda.',
            motivo: 'Ausência de boas práticas de higiene',
          ),
        ],
        interdicoes: [],
        apreensoes: [],
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
            motivo: 'Contaminação cruzada entre alimentos crus e prontos',
          ),
        ],
        apreensoes: [],
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
            itensApreendidos:
                '20kg de carne bovina resfriada, 15kg de linguiça calabresa, 10kg de frango congelado.',
          ),
          Apreensoes(
            cnpj: '87.654.321/0001-77',
            razaoSocial: 'Distribuidora de Alimentos Norte Ltda.',
            motivo: 'Produtos armazenados com pragas visíveis',
            itensApreendidos:
                '50kg de arroz, 25kg de feijão, 30 latas de milho verde.',
          ),
        ],
      ),
      Producao(
        dataInspecao: DateTime(2025, 6, 20),
        inspecoes: 0,
        denuncias: 0,
        pareceres: 0,
        notificacoes: [],
        autosInfracao: [],
        interdicoes: [],
        apreensoes: [],
      ),
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight, // Força ocupar altura total
            ),
            child: Container(
              padding: EdgeInsets.all(25),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text("Minha produção do mês"),
                  
                  ProducaoResumoDashboard(producoes: producoesTeste),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Produção Diária",
                        style: TextStyle(fontSize: 28),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          final novaProducao = await showDialog<Producao>(
                            context: context,
                            builder: (context) => CriarProducao(
                              producao: Producao(dataInspecao: DateTime.now()),
                            ),
                          );
                          if (novaProducao != null) {
                            print(novaProducao.toJson());
                            setState(() {
                              producoesTeste.add(novaProducao);
                            });
                          }
                        },
                        child: const Text("Criar"),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  const Text(
                    "Últimas produções",
                    style: TextStyle(fontSize: 18),
                  ),
                  Accordion<Producao>(
                    data: producoesTeste,
                    headerBuilder: (context, producao, isExpanded) {
                      return ListTile(
                        title: Text(
                          'Produção enviada em: ${DateFormat('dd/MM/yyyy').format(producao.dataInspecao.toLocal())}',
                        ),
                        subtitle: Text(
                          'Inspeções: ${producao.inspecoes}, Pareceres: ${producao.pareceres}, Denúncias: ${producao.denuncias}',
                        ),
                      );
                    },
                    bodyBuilder: (context, producao) {
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (producao.notificacoes.isNotEmpty) ...[
                              Text(
                                'Notificações: ${producao.notificacoes.length}',
                              ),
                              const SizedBox(height: 8),
                              TableNotificados(
                                listaEstabelecimentos: producao.notificacoes,
                              ),
                            ],
                            if (producao.autosInfracao.isNotEmpty) ...[
                              Text(
                                'Autos de Infração: ${producao.autosInfracao.length}',
                              ),
                              const SizedBox(height: 8),
                              TableNotificados(
                                listaEstabelecimentos: producao.autosInfracao,
                              ),
                            ],
                            if (producao.interdicoes.isNotEmpty) ...[
                              Text(
                                'Interdições: ${producao.interdicoes.length}',
                              ),
                              const SizedBox(height: 8),
                              TableNotificados(
                                listaEstabelecimentos: producao.interdicoes,
                              ),
                            ],
                            if (producao.apreensoes.isNotEmpty) ...[
                              Text('Apreensões: ${producao.apreensoes.length}'),
                              const SizedBox(height: 8),
                              TableNotificados(
                                listaEstabelecimentos: producao.apreensoes,
                              ),
                            ],
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
