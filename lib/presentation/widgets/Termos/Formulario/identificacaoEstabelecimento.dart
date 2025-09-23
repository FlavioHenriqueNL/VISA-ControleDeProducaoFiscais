import 'package:flutter/material.dart';
import 'package:visa_arapiraca_app/core/utils/form_masks.dart';
import 'package:visa_arapiraca_app/core/utils/form_validators.dart';
import 'package:visa_arapiraca_app/data/repositories/cnae_repository.dart';
import 'package:visa_arapiraca_app/data/repositories/endereco_repository.dart';
import 'package:visa_arapiraca_app/data/repositories/estabelecimento_repository_impl.dart';
import 'package:visa_arapiraca_app/domain/useCases/estabelecimento/getEstabelecimento.dart';
import 'package:visa_arapiraca_app/presentation/widgets/forms/formfield_cep.dart';
import 'package:visa_arapiraca_app/presentation/widgets/forms/formfield_cnae.dart';
import 'package:visa_arapiraca_app/presentation/widgets/forms/formfield_cpfCnpj.dart';
import 'package:visa_arapiraca_app/presentation/widgets/forms/formfield_parecer.dart';
import 'package:visa_arapiraca_app/presentation/widgets/forms/formControllers/informacaoEstabelecimentoController.dart';
import 'package:visa_arapiraca_app/presentation/widgets/forms/formfield_telefone.dart';

class IdentificacaoestabelecimentoFormWidget extends StatefulWidget {
  final Informacaoestabelecimentocontroller controller;

  const IdentificacaoestabelecimentoFormWidget({
    super.key,
    required this.controller,
  });

  @override
  State<IdentificacaoestabelecimentoFormWidget> createState() =>
      _IdentificacaoestabelecimentoFormWidgetState();
}

class _IdentificacaoestabelecimentoFormWidgetState
    extends State<IdentificacaoestabelecimentoFormWidget> {
  // Controllers
  late final informacaoEstabelecimentoController = widget.controller;
  late bool estabelecimentoExiste = false;
  // late Estabelecimento estabelecimentoPesquisado;

  //implementar nessa função.
  Future<void> _carregarEstabelecimento(String cnpj) async {
   
    cnpj = cnpj.replaceAll(RegExp(r'[^0-9]'), '');

    final repository = EstabelecimentoRepositoryImpl();
    final getEstabelecimento = GetEstabelecimento(repository);
    final estabelecimentoPesquisado = await getEstabelecimento(cnpj);

    if (estabelecimentoPesquisado != null) {
    informacaoEstabelecimentoController.razaoSocialController.text =
        estabelecimentoPesquisado.razaoSocial;
    informacaoEstabelecimentoController.nomeFantasiaController.text =
        estabelecimentoPesquisado.nomeFantasia ?? "";
    informacaoEstabelecimentoController.telefoneController.text =
        estabelecimentoPesquisado.telefone ?? "";
    informacaoEstabelecimentoController.emailController.text =
        estabelecimentoPesquisado.email ?? "";
    informacaoEstabelecimentoController.cnaeController.text =
        estabelecimentoPesquisado.cnae;
    informacaoEstabelecimentoController.cepController.text =
        estabelecimentoPesquisado.cep;
    informacaoEstabelecimentoController.numeroResidenciaController.text =
        estabelecimentoPesquisado.numeroResidencia;
    informacaoEstabelecimentoController.complementoController.text =
        estabelecimentoPesquisado.complemento ?? "";
    informacaoEstabelecimentoController.responsavelController.text =
        estabelecimentoPesquisado.responsavel ?? "";
    informacaoEstabelecimentoController.cpfResponsavelController.text =
        estabelecimentoPesquisado.cpfResponsavel ?? "";
    informacaoEstabelecimentoController.codigoConselhoController.text =
        estabelecimentoPesquisado.codigoConselho ?? "N/A";
    
    _carregarCnae(estabelecimentoPesquisado.cnae);
    _carregarCEP(estabelecimentoPesquisado.cep);

    setState(() {
      estabelecimentoExiste = true;
    });
    }

  }

  Future<void> _carregarCnae(String cnae) async {
    try {
      final cnaeBuscado = await CnaeRepository().getCnaeByID(cnae);
      informacaoEstabelecimentoController.cnaeController.text =
          cnaeBuscado!.codigo;
      informacaoEstabelecimentoController.cnaeDescricaoController.text =
          cnaeBuscado.descricao;
    } catch (e) {
      print(e);
      informacaoEstabelecimentoController.cnaeDescricaoController.text =
          "Cnae não encontrado";
      informacaoEstabelecimentoController.cnaeController.text = "";
    }
  }
  Future<void> _carregarCEP(String cep) async {
  cep = cep.replaceAll(RegExp(r'[^0-9]'), '');
  final cepBuscado = await EnderecoRepository().getEnderecoByCEP(cep);

  if (cepBuscado != null) {
    informacaoEstabelecimentoController.cepController.text = cepBuscado.cep!;
    informacaoEstabelecimentoController.logradouroController.text = cepBuscado.logradouro!;
    informacaoEstabelecimentoController.bairroController.text = cepBuscado.bairro!;
    informacaoEstabelecimentoController.cidadeController.text = cepBuscado.cidade!;
  } else {
    // CEP retornou mas sem dados suficientes
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Aviso"),
        content: Text("Esse é um aviso dentro de um Dialog"),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text("Fechar"),
          ),
        ],
      ),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return Column(
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
              child: FormfieldCpfcnpj(
                controller:
                    informacaoEstabelecimentoController.cpfCnpjController,
                onFieldLostFocus: () => _carregarEstabelecimento(
                  informacaoEstabelecimentoController.cpfCnpjController.text,
                ),
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
          readOnly: estabelecimentoExiste,
        ),
        const SizedBox(height: 20),
        FormfieldParecer(
          fieldTitle: "Nome Fantasia",
          fieldController:
              informacaoEstabelecimentoController.nomeFantasiaController,
          validator: (value) => campoVazio("Nome Fantasia", value),
          readOnly: estabelecimentoExiste,
        ),
        const SizedBox(height: 20),

        Row(
          children: [
            Expanded(
              flex: 1,
              child: FormfieldTelefone(
                controller:
                    informacaoEstabelecimentoController.telefoneController,
              ),
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
              child: FormfieldCnae(
                controller: informacaoEstabelecimentoController.cnaeController,
                onFieldLostFocus: () => _carregarCnae(
                  informacaoEstabelecimentoController.cnaeController.text,
                ),
              ),
            ),
            SizedBox(width: 30),
            Expanded(
              flex: 6,
              child: FormfieldParecer(
                readOnly: true,
                fieldTitle: "Descrição do CNAE",
                fieldController:
                    informacaoEstabelecimentoController.cnaeDescricaoController,
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
              child: FormfieldCEP(
                controller: informacaoEstabelecimentoController.cepController,
                onFieldLostFocus: () => _carregarCEP(informacaoEstabelecimentoController.cepController.text),
              ),
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
                maskTextInputFormatter: cpfMask,
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
