import 'package:flutter/material.dart';

class PageTitle extends StatelessWidget {

  final String title;
  final String? subtitle;
  final IconData icon;

  const PageTitle({
    required this.icon,
    required this.title,
    this.subtitle,
    
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      leading: Icon(
        icon,
        size: 60,
        color: Colors.blue,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        subtitle ?? "",
        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
      ),
    );
  }
}