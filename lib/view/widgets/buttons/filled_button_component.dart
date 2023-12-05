import 'package:flutter/material.dart';

import 'button.dart';

class FilledButtonComponent extends Button {
  final bool tonal;

  const FilledButtonComponent({
    required super.label,
    required super.action,
    super.icon,
    this.tonal = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (icon != null) {
      if (tonal) {
        return FilledButton.tonalIcon(
          icon: Image.network(icon!),
          label: Text(label!),
          onPressed: () => action!.handleInteraction(context: context),
        );
      }
      return FilledButton.icon(
        icon: Image.network(icon!),
        label: Text(label!),
        onPressed: () => action!.handleInteraction(context: context),
      );
    }
    if (tonal) {
      return FilledButton.tonal(
        child: Text(label!),
        onPressed: () => action!.handleInteraction(context: context),
      );
    }
    return FilledButton(
      child: Text(label!),
      onPressed: () => action!.handleInteraction(context: context),
    );
  }
}
