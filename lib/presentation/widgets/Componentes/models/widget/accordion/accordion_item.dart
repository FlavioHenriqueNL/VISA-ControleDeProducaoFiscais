class AccordionItem{

  String expandedValue;
  String headerValue;
  bool isExpanded;

  AccordionItem({
    required this.expandedValue, 
    required this.headerValue,
    this.isExpanded = false
  });
}