import 'package:flutter/material.dart';
import 'package:visa_arapiraca_app/core/utils/form_masks.dart';
import 'package:visa_arapiraca_app/core/utils/form_validators.dart';
import 'package:visa_arapiraca_app/presentation/widgets/forms/formfield_cep.dart';
import 'package:visa_arapiraca_app/presentation/widgets/forms/formfield_cpfCnpj.dart';
import 'package:visa_arapiraca_app/presentation/widgets/forms/formfield_parecer.dart';
import 'package:visa_arapiraca_app/presentation/widgets/forms/formControllers/informacaoEstabelecimentoController.dart';
import 'package:visa_arapiraca_app/presentation/widgets/forms/formfield_telefone.dart';

class IdentificacaoestabelecimentoFormWidget extends StatefulWidget {
  final Informacaoestabelecimentocontroller controller;

  const IdentificacaoestabelecimentoFormWidget({
    super.key,
    required this.controller
  });

  @override
  State<IdentificacaoestabelecimentoFormWidget> createState() => _IdentificacaoestabelecimentoFormWidgetState();
}

class _IdentificacaoestabelecimentoFormWidgetState extends State<IdentificacaoestabelecimentoFormWidget> {
  
  // Controllers
  late final informacaoEstabelecimentoController = widget.controller;

  @override
  Widget build(BuildContext context) {
    return 
      Column(
        children: [
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
                child: FormfieldCpfcnpj(controller: informacaoEstabelecimentoController.cpfCnpjController),
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
                child: FormfieldTelefone(controller: informacaoEstabelecimentoController.telefoneController)
              ),
              const SizedBox(width: 30),
              Expanded(
                flex: 1,
                child: FormfieldParecer(
                  fieldTitle: "Email para contato",
                  fieldController:
                      informacaoEstabelecimentoController.emailController,
                  validator: (value) => validarEmail("Email para contato", value),
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
                child: FormfieldCEP(controller: informacaoEstabelecimentoController.cepController,)
              ),
              const SizedBox(width: 30),
              Expanded(
                flex: 6,
                child: FormfieldParecer(
                  fieldTitle: "Logradouro",
                  fieldController:
                      informacaoEstabelecimentoController.logradouroController,
                  validator: null,
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
                  validator: null,
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
                  validator: null,
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
                  maskTextInputFormatter: cpfMask
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
      );  
  }
}
