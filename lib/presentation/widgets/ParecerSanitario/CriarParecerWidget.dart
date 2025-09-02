import 'package:flutter/material.dart';
import 'package:visa_arapiraca_app/domain/entities/parecersanitario.dart';
import 'package:visa_arapiraca_app/presentation/widgets/ParecerSanitario/Controllers/AnaliseTecnicaController.dart';
import 'package:visa_arapiraca_app/presentation/widgets/ParecerSanitario/Formulario/analiseTecnicaWidget.dart';
import 'package:visa_arapiraca_app/presentation/widgets/Termos/Controllers/informacaoEstabelecimentoController.dart';
import 'package:visa_arapiraca_app/presentation/widgets/Termos/Formulario/identificacaoEstabelecimento.dart';
import 'package:visa_arapiraca_app/presentation/widgets/scrollable_page.dart';

class CriarParecerWidget extends StatefulWidget {
  
  final ParecerSanitario parecer;

  const CriarParecerWidget({
    required this.parecer,
    super.key
  });

  @override
  State<CriarParecerWidget> createState() => _CriarParecerWidgetState();
}

class _CriarParecerWidgetState extends State<CriarParecerWidget> {

  //Formulário Controllers
  final informacaoEstabelecimentoController = Informacaoestabelecimentocontroller();
  final analiseTecnicaController = AnaliseTecnicaController();
  late ParecerSanitario documentoParecerSantinario;

  @override
  void initState() {
    super.initState();
    
  }



  @override
  Widget build(BuildContext context) {
    return ScrollablePage(
      child: Dialog(
        insetPadding: EdgeInsets.all(16),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.93,
          height: MediaQuery.of(context).size.height * 0.93,
          color: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ListTile(
                      leading: Icon(Icons.add_chart_outlined, size: 40, color: Colors.blue),
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        widget.parecer == null ? "Criar Parecer Sanitário" : "Editar Parecer Sanitário",
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        widget.parecer == null ? "Preencha os campos abaixo para criar um novo parecer." : "Edite os campos abaixo para atualizar o parecer.",
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                    ), 
                  ),
                  IconButton(icon: Icon(Icons.close), iconSize: 40, onPressed: () => Navigator.of(context).pop()),
                ],
              ),
              Divider(),
              SizedBox(height: 20),

              //Corpo do Formulário
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Form(
                    key: GlobalKey<FormState>(),
                    child: Column(
                      children: [
                        // Identificação do Estabelecimento
                        IdentificacaoestabelecimentoFormWidget(controller: informacaoEstabelecimentoController),
                        SizedBox(height: 30),
                        // Análise Técnica
                        AnaliseTecnicaForm(controller: analiseTecnicaController),
                      ],
                    ),
                  )
                ),
              ),
              SizedBox(height: 20),

              //Botões Ações
              Padding(
                padding: EdgeInsets.only(right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton.icon(
                      style: ParecerBottomWidgetStyle.copyWith(
                        backgroundColor: WidgetStateProperty.all<Color>(Colors.red),
                        foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
                      ),
                      onPressed:() => Navigator.of(context).pop(), 
                      label: Text("Cancelar", style: TextStyle(fontSize: 16)),
                      icon: Icon(Icons.cancel_rounded, color: Colors.white, size: 20),
                    ),
                  
                    SizedBox(width: 20),

                    ElevatedButton.icon(
                      style: ParecerBottomWidgetStyle.copyWith(
                        backgroundColor: WidgetStateProperty.all<Color>(Colors.yellow.shade600),
                        foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
                      ),
                      onPressed:() => Navigator.of(context).pop(), 
                      label: Text("Limpar", style: TextStyle(fontSize: 16)),
                      icon: Icon(Icons.cleaning_services, color: Colors.white, size: 20),
                    ),
                  
                    SizedBox(width: 20),
                    ElevatedButton.icon(
                      style: ParecerBottomWidgetStyle.copyWith(
                        backgroundColor: WidgetStateProperty.all<Color>(Colors.green),
                        foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
                      ),
                      onPressed: () {
                        //Salvar Parecer
                      }, 
                      label: Text(widget.parecer == null ? "Criar Parecer" : "Salvar Alterações", style: TextStyle(fontSize: 16)),
                      icon: Icon(Icons.save, color: Colors.white, size: 20),
                    ),
                  ],
                ),
              )              
            ],
          ),
        ),
      ),
    );
  }
}

class CriarParecerSanitarioButton extends StatelessWidget {
  
  const CriarParecerSanitarioButton({super.key});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      // ignore: avoid_print
      onPressed: () async { 
        final novoParecer = await showDialog(
          context: context,
          builder: (context) => CriarParecerWidget(
            parecer: 
              ParecerSanitario(
                id: '', 
                cnpj: '', 
                data: DateTime.now(), 
                numeroProcesso: '', 
                cnaePrincipal: '', 
                analiseTecnica: '', 
                validade: '', 
                taxa: '', 
                cpfFiscal: ''
              ),
            ),
        );

        print('Adicionar Parecer'); 
      }, 
      icon: Icon(Icons.add_box_outlined, color: Colors.white),
      label: Text('Adicionar Parecer'),
      style: ParecerBottomWidgetStyle.copyWith(
        backgroundColor: WidgetStateProperty.all<Color>(Colors.blue),
        foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
      ),
    );
  }
}

// Estilo padrão para os botões do parecer sanitário
final ParecerBottomWidgetStyle = ElevatedButton.styleFrom(
  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(5),
  ),
);