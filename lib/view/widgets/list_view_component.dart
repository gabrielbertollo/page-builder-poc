import 'package:flutter/material.dart';

class ListViewComponent extends StatelessWidget {
  final List<Widget> children;

  const ListViewComponent({
    this.children = const [],
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: children,
    );
  }
}
