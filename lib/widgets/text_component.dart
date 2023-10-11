import 'package:flutter/material.dart';

import '../core/helpers/material_theme_extension.dart';
import 'loading_shimmer.dart';

class TextComponent extends StatelessWidget {
  final String text;
  final Color color;
  final double? fontSize;

  const TextComponent(
    this.text, {
    this.color = Colors.black,
    this.fontSize,
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

class TextComponentSkeleton extends StatelessWidget {
  final double characterLength;
  final double fontSize;

  const TextComponentSkeleton({
    this.characterLength = 100,
    this.fontSize = 20,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LoadingShimmer(
      child: Container(
        decoration: BoxDecoration(
          color: context.colorScheme.outline,
          borderRadius: BorderRadius.circular(12.0),
        ),
        width: characterLength,
        height: fontSize,
      ),
    );
  }
}
