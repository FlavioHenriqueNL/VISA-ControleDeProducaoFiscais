import 'package:flutter/material.dart';

  class DialogHeader extends StatelessWidget {

    final String? headerTitle;
    final String? headerSubtitle;

    const DialogHeader({
      this.headerTitle,
      this.headerSubtitle,
      super.key
    });

    @override
    Widget build(BuildContext context) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ListTile(
              leading: Icon(
                Icons.add_chart_outlined,
                size: 40,
                color: Colors.blue,
              ),
              contentPadding: EdgeInsets.zero,
              title: Text(
                headerTitle ?? "",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                headerSubtitle ?? "",
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.close),
            iconSize: 40,
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      );
    }
  }