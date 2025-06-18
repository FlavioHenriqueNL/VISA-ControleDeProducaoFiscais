import 'package:flutter/material.dart';

class Accordion<T> extends StatefulWidget {

  final List<T> data;
  final Widget Function(BuildContext context, T item, bool isExpanded) headerBuilder;
  final Widget Function(BuildContext context, T item) bodyBuilder;

  const Accordion({
    super.key,
    required this.data,
    required this.headerBuilder,
    required this.bodyBuilder
  });

  @override
  State<Accordion<T>> createState() => _AccordionState<T>();
}

class _AccordionState<T> extends State<Accordion<T>> {
  late List<bool> _expanded;

  @override
  void initState() {
    super.initState();
    _expanded = List<bool>.filled(widget.data.length, false);
  }

  void _syncExpandedLength() {
  final dataLength = widget.data.length;
  final expandedLength = _expanded.length;

  if (expandedLength < dataLength) {
    // cria nova lista concatenando os valores antigos + novos false
    _expanded = [
      ..._expanded,
      ...List<bool>.filled(dataLength - expandedLength, false)
    ];
  } else if (expandedLength > dataLength) {
    // remove o excesso criando uma nova sublista
    _expanded = _expanded.sublist(0, dataLength);
  }
}


  @override
  void didUpdateWidget(covariant Accordion<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    _syncExpandedLength();
  }

  @override
  Widget build(BuildContext context) {
    _syncExpandedLength(); // Sincroniza também aqui, para garantir

    return ExpansionPanelList(
      expansionCallback: (index, isExpanded) {
        setState(() {
          _expanded[index] = !_expanded[index];
        });
      },
      children: List.generate(widget.data.length, (index) {
        final item = widget.data[index];
        return ExpansionPanel(
          headerBuilder: (context, isExpanded) =>
              widget.headerBuilder(context, item, isExpanded),
          body: widget.bodyBuilder(context, item),
          isExpanded: _expanded[index],
        );
      }),
    );
  }
}