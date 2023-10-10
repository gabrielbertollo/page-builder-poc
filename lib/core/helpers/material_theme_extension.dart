import 'package:flutter/material.dart';

extension MaterialTheme on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
}
