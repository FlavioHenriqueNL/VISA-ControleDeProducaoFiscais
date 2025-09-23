import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:visa_arapiraca_app/data/repositories/fiscal_repository_impl.dart';
import 'package:visa_arapiraca_app/data/repositories/session_cached_repository_impl.dart';
import 'package:visa_arapiraca_app/data/repositories/session_inmemory_repository.impl.dart';
import 'package:visa_arapiraca_app/data/repositories/user_repository_impl.dart';
import 'package:visa_arapiraca_app/domain/useCases/user/login.dart';
import 'package:visa_arapiraca_app/presentation/pages/cadastro/cadastro.dart';
import 'package:visa_arapiraca_app/presentation/pages/recuperar_senha/recuperar_senha.dart';
import 'package:visa_arapiraca_app/presentation/widgets/Componentes/scrollable_page.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}
class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  
  bool isChecked = false;
  final login = TextEditingController();
  final senha = TextEditingController();
  bool loading = false;

  late final loginUseCase = LoginUser(
    UserRepository(), 
    FiscalRepository(), 
    SessionInMemoryManager(), 
    SessionCachedRepository()
  );


  Future<void> doLogin() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => loading = true);

    try {
      await loginUseCase.call(
        login.text,
        senha.text,
        manterConectado: isChecked,
      );

      // Se chegou aqui, login e sessão OK
      // Redireciona para tela principal
      context.go('/dashboard'); // usando GoRouter

    } catch (e) {
      // Exibe erro na UI
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text("Erro no login"),
          content: Text(e.toString()),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Fechar"),
            ),
          ],
        ),
      );
    } finally {
      setState(() => loading = false);
    }
  }

  Future<void> testGetAllFiscais() async {
  try {
    final snapshot = await FirebaseFirestore.instance
        .collection('fiscal')
        .get();

    print('Total de documentos: ${snapshot.docs.length}');
    for (var doc in snapshot.docs) {
      print(doc.data());
    }
  } catch (e) {
    print('Erro ao buscar fiscais: $e');
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: backgroundDecoration,
        child: ScrollablePage(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            
            children: [

              
              Image.asset("assets/VisaLogo.png"),
              SizedBox(height: 30),
              
              Form(
                key: _formKey,
                child: Column(
                  children: [

                    TextFormField(autofocus: true, decoration: textFieldDecoration("Número de Matrícula ou CPF", Icons.people), controller: login,),
                    const SizedBox(height: 15),

                    TextFormField(autofocus: false, obscureText: true, decoration: textFieldDecoration("Senha", Icons.key), controller: senha,),
                    const SizedBox(height: 25),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: CheckboxListTile(
                            value: isChecked, 
                            onChanged: (bool? value){
                              setState(() {
                                isChecked = value!;
                              });
                            },
                            title: const Text("Manter Conectado", style: TextStyle(color: Colors.white)),
                            fillColor: WidgetStateProperty.all(Colors.amber),
                            controlAffinity: ListTileControlAffinity.leading,
                            contentPadding: const EdgeInsets.only(right: 16)
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () => doLogin(),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                          child: const Text("Login", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        )
                      ],
                    ), 
                  ],
                ),
              ),


              Column(
                children: [

                  const SizedBox(height: 25),
                  const Divider(color: Colors.white, height: 1),
                  const SizedBox(height: 25),

                  const Text(
                    "Ainda não tem Cadastro?",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  const SizedBox(height: 15),
                  accessButtonType(context, "Cadastrar", Cadastro()),
                  
                  const SizedBox(height: 35),

                  const Text(
                    "Esqueceu a senha?",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  const SizedBox(height: 15),
                  accessButtonType(context, "Recuperar Acesso", RecuperarSenha()),
                ],
              ),

              const SizedBox(height: 30),
              const Text(
                "Um desenvolvimento de Flávio Henrique",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              

            ],
          ),
        ),
      ),
    );
  }
}

InputDecoration textFieldDecoration(String title, IconData icon) {
  return InputDecoration(
    labelText: title,
    labelStyle: TextStyle(color: Colors.white),
    prefixIcon: Icon(icon, color: Colors.white),
    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 1.5)),
    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 2)), 
  );
}

BoxDecoration backgroundDecoration = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topCenter, 
    end: Alignment.bottomCenter, 
    colors: [Color(0xFFD4F7FF), Colors.blue]
  )
);

Widget accessButtonType(BuildContext context, String title, Widget widgetPage){
  return SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> widgetPage));
      }, 
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
      ),
      child: Text(title),
    ),
  );
} 