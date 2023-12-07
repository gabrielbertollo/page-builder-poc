import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:ui';
import 'dart:math' as math;

import '../../../data/entities/action.dart';
import '../../../home.dart';
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

  Widget child(BuildContext context, bool isLoading) {
    if (isLoading) {
      return const SizedBox(
        height: 16,
        width: 16,
        child: CircularProgressIndicator(strokeWidth: 2.5),
      );
    }

    if (icon != null) {
      final double scale = MediaQuery.textScaleFactorOf(context);
      // Adjust the gap based on the text scale factor. Start at 8, and lerp
      // to 4 based on how large the text is.
      final double gap =
          scale <= 1 ? 8 : lerpDouble(8, 4, math.min(scale - 1, 1))!;
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.network(icon!),
          SizedBox(width: gap),
          Flexible(child: Text(label!))
        ],
      );
    }

    return Text(label!);
  }

  void onPressed(
    BuildContext context,
    ValueNotifier<bool> isLoadingListenable,
  ) {
    if (action is SubmitAction) {
      (action as SubmitAction).handleInteraction(
        context: context,
        notifier: isLoadingListenable,
        onSuccess: () {
          Navigator.of(context).pop();
          context.read<HomeProvider>().refresh();
        },
      );
      return;
    }
    action!.handleInteraction(context: context);
  }

  @override
  Widget build(BuildContext context) {
    final isLoadingListenable = ValueNotifier<bool>(false);
    return ValueListenableBuilder(
      valueListenable: isLoadingListenable,
      builder: (_, isLoading, widget) {
        if (tonal) {
          return FilledButton.tonal(
            onPressed: isLoading
                ? null
                : () => onPressed(context, isLoadingListenable),
            child: child(context, isLoading),
          );
        }
        return FilledButton(
          onPressed:
              isLoading ? null : () => onPressed(context, isLoadingListenable),
          child: child(context, isLoading),
        );
      },
    );
  }
}
