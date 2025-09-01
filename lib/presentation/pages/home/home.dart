import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints){
      return SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: Column(
            
            children: [
              Text("Produção de Julho", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              Padding(
                padding: EdgeInsets.all(25),
                child: Wrap(
                  spacing: 12,    // espaço horizontal entre os cards
                  runSpacing: 12, // espaço vertical entre as linhas
                  children: 
                    List.generate(8, (index) {
                    return SizedBox(
                      width: 150,
                      height: 150,
                      child: Card(
                        child: Center(child: Text('Card $index')),
                      ),
                    );
                  }),
                  
                  
                )
              )
            ],
          )
        ), 
      );
    });
  }
}