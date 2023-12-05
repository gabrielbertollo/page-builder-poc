import 'package:flutter/material.dart';

import '../../../data/entities/action.dart' as abstract_action;

class Button extends StatelessWidget {
  final String? label;
  final String? icon;
  final abstract_action.Action? action;

  const Button({
    this.label,
    this.icon,
    this.action,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
