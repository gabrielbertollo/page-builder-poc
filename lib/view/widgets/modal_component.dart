import 'package:flutter/material.dart';

import 'form_component.dart';

class ModalComponent extends StatelessWidget {
  final String id;
  final String title;
  final String? description;
  final List<Widget> children;
  final FormComponent? form;
  final List<Widget>? buttons;

  const ModalComponent({
    required this.id,
    required this.title,
    this.description,
    this.children = const [],
    this.form,
    this.buttons,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      key: Key(id),
      title: Text(title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (description != null) Text(description!),
          form ?? Column(children: children),
        ],
      ),
      actions: buttons,
    );
  }
}
