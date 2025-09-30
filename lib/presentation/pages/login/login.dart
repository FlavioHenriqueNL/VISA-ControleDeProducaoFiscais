
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:visa_arapiraca_app/core/utils/form_validators.dart';
import 'package:visa_arapiraca_app/data/repositories/fiscal_repository_impl.dart';
import 'package:visa_arapiraca_app/data/repositories/session_cached_repository_impl.dart';
import 'package:visa_arapiraca_app/data/repositories/session_inmemory_repository.impl.dart';
import 'package:visa_arapiraca_app/data/repositories/user_repository_impl.dart';
import 'package:visa_arapiraca_app/domain/errors/auth_exceptions.dart';
import 'package:visa_arapiraca_app/domain/repositories/fiscal_repository.dart';
import 'package:visa_arapiraca_app/domain/repositories/session_repository.dart';
import 'package:visa_arapiraca_app/domain/repositories/user_repository.dart';
import 'package:visa_arapiraca_app/domain/useCases/user/login.dart';
import 'package:visa_arapiraca_app/presentation/pages/cadastro/cadastro.dart';
import 'package:visa_arapiraca_app/presentation/pages/recuperar_senha/recuperar_senha.dart';
import 'package:visa_arapiraca_app/presentation/widgets/Componentes/scrollable_page.dart';
import 'package:visa_arapiraca_app/presentation/widgets/login/dialog_login.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}
class _LoginState extends State<Login> {

  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  bool isChecked = false;
  final loginController = TextEditingController();
  final senhaController = TextEditingController();
  late var login = LoginUser(UserRepository(), FiscalRepository());
  
  Future<void> doLogin() async {
    if (!_formKey.currentState!.validate()) {
      setState(() {
        loading = false;
      }); 
      return;
    }

    // Define a implementação de sessão com base no checkbox
    final ISessionManagerRepository session = isChecked
      ? SessionCachedRepository()
      : SessionInMemoryManager();

    try {
      await login(
        loginController.text.trim(),
        senhaController.text,
        session,
      ); 
      // Login e sessão OK, redireciona
      context.go('/dashboard');
    } catch (e) {
      // Exibe o diálogo de erro
      showDialog(
        context: context,
        builder: (_) => DialogLogin(
          title: "Falha ao Efetuar Login", 
          message: e.toString()
        )
      );
      setState(() => loading = false);
    }
  }

  @override
  void dispose() {
    loginController.dispose();
    senhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: backgroundDecoration,
        child: ScrollablePage(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 75),   
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,       
            children: [

              Padding(
                padding: EdgeInsets.symmetric(vertical: 40),
                child: Image.asset("assets/VisaLogo.png"),
              ),
              
              Column(
                children: [

                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        
                        TextFormField(autofocus: true, decoration: textFieldDecoration("Login (Email)", Icons.people), controller: loginController, validator: (value) => validarEmail("Email", value),),
                        const SizedBox(height: 15),

                        TextFormField(autofocus: false, obscureText: true, decoration: textFieldDecoration("Senha", Icons.key), controller: senhaController, validator: (value) => campoVazio
                        ("Senha", value),),
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
                              onPressed: () => {
                                if (!loading) {
                                  setState(() => loading = true),
                                  doLogin()
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.amber,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              ),
                              child: loading ? const CircularProgressIndicator(color: Colors.white) : const Text("Login", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                            )
                          ],
                        ), 
                      ],
                    ),
                  ),

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

              
              Padding(
                padding: EdgeInsetsGeometry.symmetric(vertical: 30),
                child: Text(
                  "Um desenvolvimento de Flávio Henrique",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
              

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