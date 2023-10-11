import 'package:flutter/material.dart';

class ModalComponent extends StatelessWidget {
  final Widget title;
  final Widget? content;
  final List<Widget>? actions;

  const ModalComponent({
    required this.title,
    this.content,
    this.actions,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: title,
      content: content,
      actions: actions,
    );
  }
}
