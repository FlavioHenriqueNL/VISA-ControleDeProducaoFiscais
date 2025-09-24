extension StringUtils on String{
  String primeiroNome(){
    final index = indexOf(" ");
    if(index == -1) return this;
    return substring(0, index);
  }
  String ultimoNome(){
    final index = indexOf(" ");
    if(index == -1) return this;
    return substring(index + 1);
  }
}