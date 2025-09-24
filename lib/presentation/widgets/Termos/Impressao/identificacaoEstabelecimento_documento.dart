import 'package:pdf/widgets.dart' as pw;
import 'package:visa_arapiraca_app/data/dtos/EnderecoDTO.dart';
import 'package:visa_arapiraca_app/domain/entities/estabelecimento.dart';
import 'package:visa_arapiraca_app/presentation/widgets/termos/Componentes/identificacaoField_pdf.dart';
import 'package:visa_arapiraca_app/presentation/widgets/termos/Componentes/stack_container_pdf.dart';

class PWIdentificacaoEstabelecimentoParecer extends pw.StatelessWidget {
  final Estabelecimento estabelecimento;
  final EnderecoDTO endereco;

  PWIdentificacaoEstabelecimentoParecer({
    required this.estabelecimento,
    required this.endereco,
    
  });

  @override
  pw.Widget build(pw.Context context) {
    return PWStackContainer(
      title: "Identificação do Estabelecimento",
      child: pw.Column(
        children: [
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Expanded(
                child: PWIdentificacaoField(
                  field: "CNPJ ou CPF:",
                  value: estabelecimento.cpfCnpj,
                ),
              ),
              pw.Expanded(
                child: PWIdentificacaoField(
                  field: "Número do Processo",
                  value: estabelecimento.numeroAlvara,
                ),
              ),
            ],
          ),
          pw.SizedBox(height: 3),
          PWIdentificacaoField(
            field: "Razão Social:",
            value: estabelecimento.razaoSocial,
          ),
          pw.SizedBox(height: 3),
          PWIdentificacaoField(
            field: "Nome Fantasia:",
            value: estabelecimento.nomeFantasia,
          ),

          pw.SizedBox(height: 7),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Expanded(
                child: PWIdentificacaoField(
                  field: "CEP:",
                  value: estabelecimento.cep,
                ),
              ),
              pw.Expanded(
                child: PWIdentificacaoField(
                  field: "Endereço:",
                  value: "${endereco.logradouro}, ${endereco.numeroResidencia}, ${endereco.bairro}"
                )
              ),
            ],
          ),
          pw.SizedBox(height: 3),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Expanded(
                child: PWIdentificacaoField(
                  field: "Telefone:",
                  value: estabelecimento.telefone,
                ),
              ),
              pw.Expanded(
                child: PWIdentificacaoField(
                  field: "E-mail:",
                  value: estabelecimento.email,
                ),
              ),
            ],
          ),
          pw.SizedBox(height: 7),
          PWIdentificacaoField(
            field: "Responsável:",
            value: estabelecimento.responsavel,
          ),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Expanded(
                child: PWIdentificacaoField(
                  field: "CPF do Responsável:",
                  value: estabelecimento.cpfResponsavel,
                ),
              ),
              pw.Expanded(
                child: PWIdentificacaoField(
                  field: "Código do Conselho:",
                  value: estabelecimento.codigoConselho ?? "N/A",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
