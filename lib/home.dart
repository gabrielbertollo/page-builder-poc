import 'dart:async';

import 'package:flutter/material.dart';
import 'data/datasources/page_builder_datasource.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PageBuilderDatasource _pageBuilderDatasource = PageBuilderDatasource();
  final Completer<Widget> _pageBuilderCompleter = Completer<Widget>();

  @override
  void initState() {
    _loadPageBuilder();
    super.initState();
  }

  Future<void> _loadPageBuilder() async {
    try {
      final pageBuilder = await _pageBuilderDatasource.getPageBuilder();
      _pageBuilderCompleter.complete(pageBuilder);
    } catch (e) {
      _pageBuilderCompleter.completeError(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page Builder POC')),
      body: FutureBuilder<Widget>(
        future: _pageBuilderCompleter.future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return snapshot.data!;
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error'));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
