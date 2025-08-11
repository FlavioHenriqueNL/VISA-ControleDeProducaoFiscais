import 'package:flutter/material.dart';

class PreviewParecerSanitario extends StatelessWidget {
  const PreviewParecerSanitario({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preview Parecer Sanitário'),
      ),
      body: InteractiveViewer(
        boundaryMargin: const EdgeInsets.all(80.0),
        minScale: 0.1,
        maxScale: 3.0,
        child: Center(
          child: SizedBox(
            width: 1280,
            height: 1810,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: []
              )
            ),
          ),
        )
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        // onPressed: () async {
        //   final pdfData = await generateDocument(data);
        //   await Printing.layoutPdf(
        //     onLayout: (_) async => pdfData,
        //   );
        // },
        icon: const Icon(Icons.print),
        label: const Text('Imprimir PDF'),
      ),
    );
  }
}