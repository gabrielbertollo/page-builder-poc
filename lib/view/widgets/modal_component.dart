import 'package:flutter/material.dart';

import 'form_component.dart';

class ModalComponent extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final FormComponent? form;
  final List<Widget>? actions;

  const ModalComponent({
    required this.title,
    this.children = const [],
    this.form,
    this.actions,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: form ?? Column(children: children),
      actions: actions,
    );
  }
}
