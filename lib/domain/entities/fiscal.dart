class Fiscal {
  final String cpf;
  final String nome;
  final String matricula;
  final String email;
  final String? role;
  final bool isAdmin;
  final String? phone;


  Fiscal({
    required this.cpf,
    required this.nome,
    required this.matricula,
    required this.email,
    this.role,
    required this.isAdmin,
    this.phone,
 
  });

  @override
  String toString() {
    return 'Fiscal{id: $cpf, nome: $nome, matricula: $matricula, phone: $phone}';
  }
}
