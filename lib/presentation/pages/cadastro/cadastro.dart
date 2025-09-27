import 'package:flutter/material.dart';
import 'package:visa_arapiraca_app/core/utils/form_validators.dart';
import 'package:visa_arapiraca_app/data/models/fiscal_model.dart';
import 'package:visa_arapiraca_app/data/repositories/fiscal_repository_impl.dart';
import 'package:visa_arapiraca_app/data/repositories/user_repository_impl.dart';
import 'package:visa_arapiraca_app/domain/entities/fiscal.dart';
import 'package:visa_arapiraca_app/domain/useCases/user/register.dart';
import 'package:visa_arapiraca_app/presentation/widgets/Componentes/visa_app_bar.dart';
import 'package:visa_arapiraca_app/presentation/widgets/forms/formControllers/informacaoFiscal_Controller.dart';
import 'package:visa_arapiraca_app/presentation/widgets/forms/formfield_cpfCnpj.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  
  InformacaoFiscalController controller = InformacaoFiscalController();
  TextEditingController confirmarSenhaController = TextEditingController();

  @override
  void initState() {


    super.initState();
  }
  
  String? isSenhasCompativeis (String senha, String? confirmacaoSenha){
    if(senha != confirmacaoSenha)  return "As senhas devem ser iguais."; 
    return null;
  }

  final _formKey = GlobalKey<FormState>();

  final cadastrarUsuario = RegisterUser(userRepository: UserRepository(), fiscalRepository: FiscalRepository());
  Future<void> cadastrar() async{
    if(!_formKey.currentState!.validate()) return; 

    FiscalModel fiscal = FiscalModel(
      cpf: controller.cpfFiscal.text,
      nome: controller.nomeFiscal.text,
      matricula: controller.matriculaFiscal.text,
      email: controller.emailFiscal.text,
      role: 'Fiscal Sanitário',
      isAdmin: false,
      phone: ""
    );

    Fiscal fiscalData = fiscal.toEntity();

    await cadastrarUsuario(
      controller.emailFiscal.text,
      confirmarSenhaController.text,
      fiscalData
    );
  }
  

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: VisaAppBar(title: "Cadastro"),
      body: Container(
        padding: EdgeInsets.fromLTRB(40, 120, 40, 120),
        decoration: BoxDecoration(color: Colors.lightBlueAccent),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Row(children: [
                Expanded(flex: 1, 
                  child: TextFormField(
                    autofocus: true,
                    decoration: textDecoration("Número de Matrícula"),
                    style: TextStyle(color: Colors.white, fontSize: 14),
                    controller: controller.matriculaFiscal,
                    validator: (value) =>campoVazio("O número de matricula", value),
                  ),
                ),

                SizedBox(width: 15),

                Expanded(flex: 1,
                  child: FormfieldCpfcnpj(
                    controller: controller.cpfFiscal,
                    decoration: textDecoration("Cadastro de Pessoa Física - CPF"),
                  ),
                )
              ]),
              SizedBox(height: 25),
              TextFormField(
                autofocus: false,
                decoration: textDecoration("Nome Completo"),
                style: TextStyle(color: Colors.white, fontSize: 14),
                controller: controller.nomeFiscal,
                validator: (value) => campoVazio("O nome completo", value),
              ),
              SizedBox(height: 25),
              TextFormField(
                autofocus: false,
                decoration: textDecoration("Email"),
                style: TextStyle(color: Colors.white, fontSize: 14),
                controller: controller.emailFiscal,
                validator: (value) => validarEmail("Email", value),
              ),
              SizedBox(height: 25),
              TextFormField(
                autofocus: false,
                decoration: textDecoration("Senha"),
                style: TextStyle(color: Colors.white, fontSize: 14),
                controller: controller.senhaFiscal,
                validator: (value) => isSenhasCompativeis(controller.senhaFiscal.text, value),
              ),
              SizedBox(height: 25),
              TextFormField(
                autofocus: false,
                decoration: textDecoration("Confirme sua senha"),
                style: TextStyle(color: Colors.white, fontSize: 14),
                controller: confirmarSenhaController,
                validator: (value) => isSenhasCompativeis(controller.senhaFiscal.text, value),
              ),
              SizedBox(height: 25),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () => cadastrar(),
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.blueAccent),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),

                  child: Text(
                    "Cadastrar",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

TextStyle textStyle = TextStyle(color: Colors.white, fontSize: 14);

InputDecoration textDecoration(String label) {
  return  InputDecoration(
    labelText: label,
    labelStyle: TextStyle(color: Colors.white, fontSize: 21),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white, width: 1.5),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white, width: 1.5),
    ),
  );
} 
