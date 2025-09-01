import 'package:flutter/material.dart';
import 'package:visa_arapiraca_app/core/utils/form_validators.dart';
import 'package:visa_arapiraca_app/presentation/widgets/visa_app_bar.dart';

class RecuperarSenha extends StatefulWidget {
  const RecuperarSenha({super.key});

  @override
  State<RecuperarSenha> createState() => _RecuperarSenhaState();
}

class _RecuperarSenhaState extends State<RecuperarSenha> {

  late TextEditingController email;

  @override
  void initState() {
    super.initState();
    email = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    email.dispose();
  }

  // TODO: Criar validação do campo email
  // TODO: Criar retorno caso email não exista no sistema.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VisaAppBar(title: "Recuperar Acesso"),
      body: 
        Container(
          padding: EdgeInsets.symmetric(vertical: 100, horizontal: 50),
          child: Column(
            children: [
              Form(child: Column(
                children: [
                  Text(
                    "Insira o email que está cadastrado a sua conta, será enviado uma solicitação para o administrador da aplicação.",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 4, 107, 184)
                    ),
                  ),

                  SizedBox(height: 75,),

                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Email",
                      prefixIcon: Icon(Icons.email, color: Color.fromARGB(255, 4, 107, 184),),
                    ),
                    controller: email,
                    validator: (value) => validarEmail(value, "Email inválido"),
                  ),

                  SizedBox(height: 50,),

                  SizedBox(
                    width: double.infinity,
                    height: 40,
                    child: FilledButton(
                      onPressed: () {
                        print("Solcitação enviada com sucesso.");
                      },
                      style: FilledButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 4, 107, 184),
                        foregroundColor: Color(0xFFFBB408),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                      ),

                      child: 
                        Text(
                          "Solicitar Acesso",
                          style: TextStyle(
                            fontWeight: FontWeight.bold
                          ),
                        ),
                  
                    ),
                  )

                ],
              )),
            ],
          ),
        )
    );
  }
}