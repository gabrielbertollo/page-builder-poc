import 'package:flutter/material.dart';

class SearchablePage extends StatelessWidget {
  final Widget title;
  final Widget body;

  const SearchablePage({
    required this.title,
    required this.body,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: title,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: body,
    );
  }
}
