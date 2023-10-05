import 'package:flutter/material.dart';

class TextComponent extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;

  const TextComponent(
    this.text, {
    this.color = Colors.black,
    this.fontSize = 14.0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
      ),
    );
  }
}
