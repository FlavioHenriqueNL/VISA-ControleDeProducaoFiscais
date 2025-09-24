import 'package:flutter/material.dart';

class DashboardBody extends StatelessWidget {
  final Widget child;
  const DashboardBody({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: dashboardContainerDecoration(context),
      child: child,
    );
  }

}

BoxDecoration dashboardContainerDecoration(BuildContext context){
  return BoxDecoration(
    color: Theme.of(context).canvasColor,
    borderRadius: BorderRadius.circular(8),
    boxShadow: [
      BoxShadow(
        // ignore: deprecated_member_use
        color: Colors.black.withOpacity(0.1),
        blurRadius: 4,
        offset: Offset(0, 2),
      ),
    ],
  );
}
