import 'package:pdf/widgets.dart' as pw;

class PWIdentificacaoField extends pw.StatelessWidget {
  final String field;
  final String? value;

  PWIdentificacaoField({required this.field, this.value});

  @override
  pw.Widget build(pw.Context context) {
    return pw.Row(
      children: [
        pw.Text(
          field,
          style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold),
        ),
        pw.SizedBox(width: 10),
        pw.Text(value ?? "", style: pw.TextStyle(fontSize: 18)),
      ],
    );
  }
}
