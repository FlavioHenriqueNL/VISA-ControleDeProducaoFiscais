import 'package:flutter/material.dart';

class ScrollablePage extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;

  const ScrollablePage({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.symmetric(horizontal: 24),
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          padding: padding,
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: SafeArea(child: child),
            ),
          ),
        );
      },
    );
  }
}
