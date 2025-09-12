import 'package:pdf/widgets.dart' as pw;
import 'package:visa_arapiraca_app/domain/entities/estabelecimento.dart';
import 'package:visa_arapiraca_app/presentation/widgets/termos/Componentes/identificacaoField_pdf.dart';
import 'package:visa_arapiraca_app/presentation/widgets/termos/Componentes/stack_container_pdf.dart';

class PWIdentificacaoEstabelecimentoParecer extends pw.StatelessWidget {
  final Estabelecimento estabelecimento;
  final String? numeroProcesso;

  PWIdentificacaoEstabelecimentoParecer({
    required this.estabelecimento,
    this.numeroProcesso,
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
                  value: numeroProcesso,
                ),
              ),
            ],
          ),
          pw.SizedBox(height: 5),
          PWIdentificacaoField(
            field: "Razão Social:",
            value: estabelecimento.razaoSocial,
          ),
          pw.SizedBox(height: 5),
          PWIdentificacaoField(
            field: "Nome Fantasia:",
            value: estabelecimento.nomeFantasia,
          ),

          pw.SizedBox(height: 10),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Expanded(
                child: PWIdentificacaoField(
                  field: "CEP:",
                  value: estabelecimento.cep,
                ),
              ),
              pw.Expanded(child: PWIdentificacaoField(field: "Endereço:")),
            ],
          ),
          pw.SizedBox(height: 5),
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
          pw.SizedBox(height: 10),
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
