import 'package:flutter/material.dart';
import 'package:visa_arapiraca_app/models/producao/producao_model.dart';
import 'package:visa_arapiraca_app/models/producao/producao_resumo_model.dart';
import 'package:visa_arapiraca_app/presentation/widgets/producao/producao_resumo_box_item.dart';

class ProducaoResumoDashboard extends StatelessWidget {
  
  final List<Producao> producoes;

  const ProducaoResumoDashboard({super.key, required this.producoes});

  List<ProducaoResumo> getResumoProducaoTotal(){
    return[
      ProducaoResumo('Inspeções', producoes.fold(0, (soma,p) => soma + (p.inspecoes ?? 0))),
      ProducaoResumo('Pareceres', producoes.fold(0, (soma,p) => soma + (p.pareceres ?? 0))),
      ProducaoResumo('Denúncias', producoes.fold(0, (soma,p) => soma + (p.denuncias ?? 0))),
      ProducaoResumo('Notificações', producoes.fold(0, (soma,p) => soma + (p.notificacoes.length))),
      ProducaoResumo('Autos de Infração', producoes.fold(0, (soma,p) => soma + (p.autosInfracao.length))),
      ProducaoResumo('Interdições', producoes.fold(0, (soma,p) => soma + (p.interdicoes.length))),
      ProducaoResumo('Apreensões', producoes.fold(0, (soma,p) => soma + (p.apreensoes.length))),
    ];
  }

  @override
  Widget build(BuildContext context) {

    final totais = getResumoProducaoTotal();

    return LayoutBuilder(
      builder: (context, constraints) {
        // calcula a largura de cada item com base na largura disponível
        double itemWidth = constraints.maxWidth / 5;        
        return Wrap(
          crossAxisAlignment: WrapCrossAlignment.end,
          spacing: 12,
          runSpacing: 12,
          children: totais.map((resumo){
            return SizedBox(
              width: itemWidth -12,
              child: ProducaoBox(nomeItem: resumo.titulo, quantidadeItem: resumo.quantidade.toString()),
            );
          }).toList(),
        );
      },
    );
  }
}