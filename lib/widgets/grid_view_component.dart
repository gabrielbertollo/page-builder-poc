import 'package:flutter/material.dart';

class GridViewComponent extends StatelessWidget {
  final List<Widget> children;

  const GridViewComponent({
    this.children = const [],
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      children: children,
    );
  }
}
