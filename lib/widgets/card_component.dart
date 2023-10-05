import 'package:flutter/material.dart';

class CardComponent extends StatelessWidget {
  final Widget child;
  final Color? color;

  const CardComponent({
    required this.child,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: child,
    );
  }
}
