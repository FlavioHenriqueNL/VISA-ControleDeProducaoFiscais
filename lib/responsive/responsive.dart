import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const ResponsiveLayout({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop
  });

  static bool isMobile(BuildContext context) => MediaQuery.sizeOf(context).width < 768;
  static bool isTablet(BuildContext context) => MediaQuery.sizeOf(context).width > 768 && MediaQuery.sizeOf(context).width < 1200;
  static bool isDesktop(BuildContext context) => MediaQuery.sizeOf(context).width > 1200;

  
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints){
        if(constraints.maxWidth < 768){
          return mobile;
        }else if(constraints.maxHeight > 768 && constraints.maxWidth < 1200){
          return tablet;
        }else{
          return desktop;
        }
      }
    );  
  }
}

