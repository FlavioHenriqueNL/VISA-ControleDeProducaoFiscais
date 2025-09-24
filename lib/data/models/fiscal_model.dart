import 'package:visa_arapiraca_app/domain/entities/fiscal.dart';

class FiscalModel {
  final String cpf;
  final String nome;
  final String matricula;
  final String email;
  final String? role;
  final bool isAdmin;
  final String? phone;

  FiscalModel({
    required this.cpf,
    required this.nome,
    required this.matricula,
    required this.email,
    this.role,
    required this.isAdmin,
    this.phone,
  });

  // ---------- JSON ----------
  factory FiscalModel.fromJson(Map<String, dynamic> json) {
    return FiscalModel(
      cpf: json['cpf'] as String,
      nome: json['nome'] as String,
      matricula: json['matricula'] as String,
      email: json['email'] as String,
      role: json['role'] as String?,
      isAdmin: json['isAdmin'] as bool? ?? false,
      phone: json['phone'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cpf': cpf,
      'nome': nome,
      'matricula': matricula,
      'email': email,
      'role': role,
      'isAdmin': isAdmin,
      'phone': phone,
    };
  }

  // ---------- ENTITY ----------
  factory FiscalModel.fromEntity(Fiscal entity) {
    return FiscalModel(
      cpf: entity.cpf,
      nome: entity.nome,
      matricula: entity.matricula,
      email: entity.email,
      role: entity.role,
      isAdmin: entity.isAdmin,
      phone: entity.phone,
    );
  }

  Fiscal toEntity() {
    return Fiscal(
      cpf: cpf,
      nome: nome,
      matricula: matricula,
      email: email,
      role: role,
      isAdmin: isAdmin,
      phone: phone,
    );
  }
}
