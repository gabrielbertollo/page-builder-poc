import 'package:flutter/material.dart';

import '../data/action_handler.dart';
import 'loading_shimmer.dart';

class ButtonComponent extends StatelessWidget {
  final String label;
  final Map<String, dynamic> action;
  final bool filled;

  const ButtonComponent({
    required this.label,
    required this.action,
    this.filled = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (!filled) {
      return TextButton(
        onPressed: () => ActionHandler.handleAction(action, context),
        child: Text(label),
      );
    }
    return FilledButton(
      onPressed: () => ActionHandler.handleAction(action, context),
      child: Text(label),
    );
  }
}

class ButtonSkeleton extends StatelessWidget {
  final double characterLength;

  const ButtonSkeleton({
    this.characterLength = 100,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LoadingShimmer(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50.0),
        ),
        width: characterLength + 16,
        height: 30,
      ),
    );
  }
}
