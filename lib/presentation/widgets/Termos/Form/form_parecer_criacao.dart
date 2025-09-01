import 'package:flutter/material.dart';
import 'package:visa_arapiraca_app/core/utils/form_validators.dart';
import 'package:visa_arapiraca_app/presentation/widgets/Formularios/formfield_parecer.dart';
import 'package:visa_arapiraca_app/widgets/Pareceres/Form/Controllers/InformacaoEstabelecimentoController.dart';


class FormParecer extends StatefulWidget {
  const FormParecer({super.key});

  @override
  State<FormParecer> createState() => _FormParecerState();
}

class _FormParecerState extends State<FormParecer> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final informacaoEstabelecimentoController =
      Informacaoestabelecimentocontroller();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(height: 30),
          const Text("Identificação do Estabelecimento"),
          const SizedBox(height: 30),
          Row(
            children: [
              Expanded(
                child: FormfieldParecer(
                  fieldTitle: "Nº Processo",
                  fieldController: informacaoEstabelecimentoController
                      .numeroProcessoController,
                  validator: (value) => campoVazio("Número do Processo", value),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: FormfieldParecer(
                  fieldTitle: "CPF / CNPJ",
                  fieldController:
                      informacaoEstabelecimentoController.cpfCnpjController,
                  validator: (value) => campoVazio("CPF ou CNPJ", value),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          FormfieldParecer(
            fieldTitle: "Razão Social",
            fieldController:
                informacaoEstabelecimentoController.razaoSocialController,
            validator: (value) => campoVazio("Razão Social", value),
          ),
          const SizedBox(height: 20),
          FormfieldParecer(
            fieldTitle: "Nome Fantasia",
            fieldController:
                informacaoEstabelecimentoController.nomeFantasiaController,
            validator: (value) => campoVazio("Nome Fantasia", value),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: FormfieldParecer(
                  fieldTitle: "Telefone para contato",
                  fieldController:
                      informacaoEstabelecimentoController.telefoneController,
                  validator: (value) => campoVazio("Telefone", value),
                ),
              ),
              const SizedBox(width: 30),
              Expanded(
                flex: 1,
                child: FormfieldParecer(
                  fieldTitle: "Email para contato",
                  fieldController:
                      informacaoEstabelecimentoController.emailController,
                  validator: (value) => campoVazio("Email", value),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          const Text("Atividades do Estabelecimento"),
          const SizedBox(height: 30),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: FormfieldParecer(
                  fieldTitle: "CNAE",
                  fieldController:
                      informacaoEstabelecimentoController.cnaeController,
                  validator: (value) => campoVazio("Código CNAE", value),
                ),
              ),
              SizedBox(width: 30),
              Expanded(
                flex: 6,
                child: FormfieldParecer(
                  readOnly: true,
                  fieldTitle: "Descrição do CNAE",
                  fieldController: informacaoEstabelecimentoController
                      .cnaeDescricaoController,
                ),
              ),
            ],
          ),

          const SizedBox(height: 30),
          const Text("Localização do Estabelecimento"),
          const SizedBox(height: 30),

          Row(
            children: [
              Expanded(
                flex: 1,
                child: FormfieldParecer(
                  fieldTitle: "CEP",
                  fieldController:
                      informacaoEstabelecimentoController.cepController,
                  validator: (value) => validarCEP("CEP", value),
                ),
              ),
              const SizedBox(width: 30),
              Expanded(
                flex: 6,
                child: FormfieldParecer(
                  fieldTitle: "Logradouro",
                  fieldController:
                      informacaoEstabelecimentoController.logradouroController,
                  validator: (value) => campoVazio("Logradouro", value),
                  readOnly: true,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: FormfieldParecer(
                  fieldTitle: "Número",
                  fieldController: informacaoEstabelecimentoController
                      .numeroResidenciaController,
                  validator: (value) => campoVazio("Número", value),
                ),
              ),
              const SizedBox(width: 30),
              Expanded(
                flex: 6,
                child: FormfieldParecer(
                  fieldTitle: "Bairro",
                  fieldController:
                      informacaoEstabelecimentoController.bairroController,
                  validator: (value) => campoVazio("Bairro", value),
                  readOnly: true,
                ),
              ),
              const SizedBox(width: 30),
              Expanded(
                flex: 6,
                child: FormfieldParecer(
                  fieldTitle: "Cidade",
                  fieldController:
                      informacaoEstabelecimentoController.cidadeController,
                  validator: (value) => campoVazio("Cidade", value),
                  readOnly: true,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),

          const Text("Responsável Legal e/ou Técnico do Estabelecimento"),
          const SizedBox(height: 30),
          FormfieldParecer(
            fieldTitle: "Nome do Responsável",
            fieldController:
                informacaoEstabelecimentoController.responsavelController,
            validator: (value) => campoVazio("Nome do Responsável", value),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: FormfieldParecer(
                  fieldTitle: "CPF do Responsável",
                  fieldController: informacaoEstabelecimentoController
                      .cpfResponsavelController,
                  validator: (value) => campoVazio("CPF do Responsável", value),
                ),
              ),
              const SizedBox(width: 30),
              Expanded(
                flex: 1,
                child: FormfieldParecer(
                  fieldTitle: "Código do Conselho",
                  fieldController: informacaoEstabelecimentoController
                      .codigoConselhoController,
                  validator: (value) => campoVazio("Código do Conselho", value),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
