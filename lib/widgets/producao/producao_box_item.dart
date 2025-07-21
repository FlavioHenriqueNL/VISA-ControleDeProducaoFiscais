import 'package:flutter/material.dart';

class ProducaoBox extends StatefulWidget {
  final double itemWidth;
  final String nomeItem;
  final String quantidadeItem;

  const ProducaoBox({
    required this.itemWidth,
    required this.nomeItem,
    required this.quantidadeItem,
    super.key,
  });

  @override
  State<ProducaoBox> createState() => _ProducaoBoxState();
}

class _ProducaoBoxState extends State<ProducaoBox> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.itemWidth - 12, // compensando o espaçamento
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.nomeItem,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 6),
              Text(
                widget.quantidadeItem,
                style: TextStyle(fontSize: 14, color: Colors.grey[700]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
