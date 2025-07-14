import 'package:flutter/material.dart';
import 'package:visa_arapiraca_app/pages/cnaes/cnaes.dart';
import 'package:visa_arapiraca_app/pages/producao/producao_diaria.dart';
import 'package:visa_arapiraca_app/widgets/home_elevated_button.dart';
import 'package:visa_arapiraca_app/widgets/visa_app_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return(
      Scaffold(
        appBar: VisaAppBar(title: "Visa Arapiraca"),

        body:
        Padding(
          padding: EdgeInsetsGeometry.symmetric(vertical: 75, horizontal: 50),
          child: Column(
            children: [

              HomeElevatedButton(
                title: "Produção",
                onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => ProducaoDiaria(),));}
              ),

              SizedBox(height: 25,),

              HomeElevatedButton(
                title: "CNAES",
                onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => CnaesPage()));},
              ),
              
              SizedBox(height: 25,),

              HomeElevatedButton(title: "Lista de Notificações",onPressed: () {},),
              

            ],
          ),
        ), 
        
      )
    );
  }
}