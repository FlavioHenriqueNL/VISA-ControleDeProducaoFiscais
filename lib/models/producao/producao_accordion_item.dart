class ProducaoAccordionItem{

  String expandedValue;
  String headerValue;
  bool isExpanded;

  ProducaoAccordionItem({
    required this.expandedValue, 
    required this.headerValue,
    this.isExpanded = false
  });
}

List<ProducaoAccordionItem> generateItems(int numberItens){
  return List<ProducaoAccordionItem>.generate(
    numberItens,
    (int index) => ProducaoAccordionItem(headerValue: 'Panel $index', expandedValue: 'This is item number $index')
  );
}