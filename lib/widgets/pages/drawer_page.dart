import 'package:flutter/material.dart';

class DrawerPage extends StatelessWidget {
  final Widget title;
  final Widget? drawer;
  final Widget body;

  const DrawerPage({
    required this.title,
    required this.body,
    this.drawer,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: title,
      ),
      drawer: drawer,
      body: body,
    );
  }
}
