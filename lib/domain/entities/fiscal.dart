class Fiscal {
  final String cpf;
  final String nome;
  final String matricula;
  final String phone;
  final String address;

  Fiscal({
    required this.cpf,
    required this.nome,
    required this.matricula,
    required this.phone,
    required this.address,
  });

  @override
  String toString() {
    return 'Fiscal{id: $cpf, nome: $nome, matricula: $matricula, phone: $phone, address: $address}';
  }
}
