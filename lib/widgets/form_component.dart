import 'package:flutter/material.dart';

class FormComponent extends StatelessWidget {
  final List<Widget> children;

  const FormComponent({
    required this.children,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: children,
      ),
    );
  }
}
