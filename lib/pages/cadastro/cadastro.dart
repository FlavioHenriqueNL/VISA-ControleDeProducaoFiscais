import 'package:flutter/material.dart';
import 'package:visa_arapiraca_app/widgets/visa_app_bar.dart';

class Cadastro extends StatefulWidget{
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro>{

  late TextEditingController numeroMatricula;
  late TextEditingController nomeCompleto;
  late TextEditingController email;
  late TextEditingController senha;
 
  @override
  void initState(){
    super.initState();
    numeroMatricula = TextEditingController();
    nomeCompleto = TextEditingController();
    email = TextEditingController();
    senha = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    numeroMatricula.dispose();
    nomeCompleto.dispose();
    email.dispose();
    senha.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VisaAppBar(title: "Cadastro"),
      body:
        Container(
          padding: EdgeInsets.fromLTRB(40, 120, 40, 120),
          decoration: BoxDecoration(
            color: Colors.lightBlueAccent
          ),
          child: 
            Form(
          child: Column(
            children: [

              TextFormField(
                autofocus: true,
                decoration: InputDecoration(
                  labelText: "Número de Matrícula",
                  labelStyle: TextStyle(color: Colors.white, fontSize: 21),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 1.5)),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 1.5)),
                ),
                style: TextStyle(color: Colors.white, fontSize: 14),
                controller: numeroMatricula,
                validator: (value) {
                  return "true";
                },
              ),
              SizedBox(height: 25),
              TextFormField(
                autofocus: true,
                decoration: InputDecoration(
                  labelText: "Nome Completo",
                  labelStyle: TextStyle(color: Colors.white, fontSize: 21),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 1.5)),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 1.5)),
                ),
                style: TextStyle(color: Colors.white, fontSize: 14),
                controller: numeroMatricula,
                validator: (value) {
                  return "true";
                },
              ),
              SizedBox(height: 25),
              TextFormField(
                autofocus: true,
                decoration: InputDecoration(
                  labelText: "E-mail",
                  labelStyle: TextStyle(color: Colors.white, fontSize: 21),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 1.5)),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 1.5)),
                ),
                style: TextStyle(color: Colors.white, fontSize: 14),
                controller: numeroMatricula,
                validator: (value) {
                  return "true";
                },
              ),
              SizedBox(height: 25),
              TextFormField(
                autofocus: true,
                decoration: InputDecoration(
                  labelText: "Crie sua senha",
                  labelStyle: TextStyle(color: Colors.white, fontSize: 21),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 1.5)),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 1.5)),
                ),
                style: TextStyle(color: Colors.white, fontSize: 14),
                controller: numeroMatricula,
                validator: (value) {
                  return "true";
                },
              ),
              SizedBox(height: 25),
              TextFormField(
                autofocus: true,
                decoration: InputDecoration(
                  labelText: "Confirme a senha",
                  labelStyle: TextStyle(color: Colors.white, fontSize: 21),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 1.5)),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 1.5)),
                ),
                style: TextStyle(color: Colors.white, fontSize: 14),
                controller: numeroMatricula,
                validator: (value) {
                  return "true";
                },
              ),
              SizedBox(height: 25),
              
              SizedBox(width: double.infinity, height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    print("Cadastrar.");
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.blueAccent),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2)
                      )
                    )
                  ), 
                    
                  child: Text(
                    "Cadastrar",
                    style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold, fontSize: 19
                    ),
                  )
                ),
              )
            ],
          ),
        ),
      ),  
    );
  }
}