import 'package:flutter/material.dart';

class HomeElevatedButton extends StatelessWidget {

  final String title;
  final Icon? icon;
  final VoidCallback onPressed;

  const HomeElevatedButton({
    required this.title,
    required this.onPressed,
    this.icon,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return(
      SizedBox(
        width: double.infinity,
        height: 75,
        child: ElevatedButton(
          onPressed: onPressed, 
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            backgroundColor: Colors.blueAccent,
            foregroundColor: Colors.white
          ),
          child: Text(title,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w400
            ),
          )
        ),
      )
    );
  }

}