import 'package:flutter/material.dart';

class VisaAppBar extends StatelessWidget implements PreferredSizeWidget {

  final String title;
  final List<Widget>? actions;
  final Color backgroundColor;
  final Color foregroundColor;
  final double elevation;

   const VisaAppBar ({

      required this.title, 
      this.actions, 
      this.backgroundColor = Colors.blueAccent, 
      this.foregroundColor = Colors.white, 
      this.elevation = 4,
      super.key,
      
  });
    

  @override
  Widget build(BuildContext context) {
    
    return(
      AppBar(
        title: Text(title),
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        elevation: elevation,
        actions: actions,
        titleTextStyle: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white
        ),
      )
    );


  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}