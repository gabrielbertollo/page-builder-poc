import 'package:flutter/material.dart';

import '../data/action_handler.dart';

class ButtonComponent extends StatelessWidget {
  final String label;
  final Map<String, dynamic> action;

  const ButtonComponent({
    required this.label,
    required this.action,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () => ActionHandler.handleAction(action, context),
      child: Text(label),
    );
  }
}
