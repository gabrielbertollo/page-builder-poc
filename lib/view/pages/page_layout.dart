import 'package:flutter/material.dart';

class PageLayout extends StatelessWidget {
  final String title;
  final Widget body;
  final Map<String, Widget>? modals;

  const PageLayout({
    required this.title,
    required this.body,
    this.modals,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
