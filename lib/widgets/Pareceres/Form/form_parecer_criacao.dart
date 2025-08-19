import 'package:flutter/material.dart';
import 'package:visa_arapiraca_app/core/utils/form_validators.dart';
import 'package:visa_arapiraca_app/widgets/Pareceres/Form/formfield_parecer.dart';

class FormParecer extends StatefulWidget {
  const FormParecer({super.key});

  @override
  State<FormParecer> createState() => _FormParecerState();
}

class _FormParecerState extends State<FormParecer> {
  final _formKey = GlobalKey<FormState>();

  // Controladores
  // Identificação do Estabelecimento
  final TextEditingController numeroProcessoController =
      TextEditingController();
  final TextEditingController cpfCnpjController = TextEditingController();
  final TextEditingController razaoSocialController = TextEditingController();
  final TextEditingController nomeFantasiaController = TextEditingController();
  final TextEditingController telefoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  // Atividades do Estabelecimento
  final TextEditingController cnaeController = TextEditingController();
  final TextEditingController cnaeDescricaoController = TextEditingController();
  // Localização do Estabelecimento
  final TextEditingController cepController = TextEditingController();
  final TextEditingController logradouroController = TextEditingController();
  final TextEditingController numeroResidenciaController =
      TextEditingController();
  final TextEditingController bairroController = TextEditingController();
  final TextEditingController cidadeController = TextEditingController();
  final TextEditingController complementoController = TextEditingController();
  // Responsável Legal ou Técnico do Estbelecimento
  final TextEditingController responsavelController = TextEditingController();
  final TextEditingController cpfResponsavelController =
      TextEditingController();
  final TextEditingController codigoConselhoController =
      TextEditingController();

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
                  fieldController: numeroProcessoController,
                  validator: (value) => campoVazio("Número do Processo", value),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: FormfieldParecer(
                  fieldTitle: "CPF / CNPJ",
                  fieldController: cpfCnpjController,
                  validator: (value) => campoVazio("CPF ou CNPJ", value),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          FormfieldParecer(
            fieldTitle: "Razão Social",
            fieldController: razaoSocialController,
            validator: (value) => campoVazio("Razão Social", value),
          ),
          const SizedBox(height: 20),
          FormfieldParecer(
            fieldTitle: "Nome Fantasia",
            fieldController: nomeFantasiaController,
            validator: (value) => campoVazio("Nome Fantasia", value),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: FormfieldParecer(
                  fieldTitle: "Telefone para contato",
                  fieldController: telefoneController,
                  validator: (value) => campoVazio("Telefone", value),
                ),
              ),
              const SizedBox(width: 30),
              Expanded(
                flex: 1,
                child: FormfieldParecer(
                  fieldTitle: "Email para contato",
                  fieldController: emailController,
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
                  fieldController: cnaeController,
                  validator: (value) => campoVazio("Código CNAE", value),
                ),
              ),
              SizedBox(width: 30),
              Expanded(
                flex: 6,
                child: FormfieldParecer(
                  readOnly: true,
                  fieldTitle: "Descrição do CNAE",
                  fieldController: cnaeDescricaoController,
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
                  fieldController: cepController,
                  validator: (value) => validarCEP("CEP", value),
                ),
              ),
              const SizedBox(width: 30),
              Expanded(
                flex: 6,
                child: FormfieldParecer(
                  fieldTitle: "Logradouro",
                  fieldController: logradouroController,
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
                  fieldController: numeroResidenciaController,
                  validator: (value) => campoVazio("Número", value),
                ),
              ),
              const SizedBox(width: 30),
              Expanded(
                flex: 6,
                child: FormfieldParecer(
                  fieldTitle: "Bairro",
                  fieldController: bairroController,
                  validator: (value) => campoVazio("Bairro", value),
                  readOnly: true,
                ),
              ),
              const SizedBox(width: 30),
              Expanded(
                flex: 6,
                child: FormfieldParecer(
                  fieldTitle: "Cidade",
                  fieldController: cidadeController,
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
            fieldController: responsavelController,
            validator: (value) => campoVazio("Nome do Responsável", value),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: FormfieldParecer(
                  fieldTitle: "CPF do Responsável",
                  fieldController: cpfResponsavelController,
                  validator: (value) => campoVazio("CPF do Responsável", value),
                ),
              ),
              const SizedBox(width: 30),
              Expanded(
                flex: 1,
                child: FormfieldParecer(
                  fieldTitle: "Código do Conselho",
                  fieldController: codigoConselhoController,
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
