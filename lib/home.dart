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
    super.initState();
  }

  Future<void> _loadPageBuilder(String url) async {
    try {
      final pageBuilder = await _pageBuilderDatasource.getPageBuilder(url);
      _pageBuilderCompleter.complete(pageBuilder);
    } catch (e) {
      _pageBuilderCompleter.completeError(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map?;
    _loadPageBuilder(args?['requestUrl'] ?? 'http://localhost:3000/home');
    return Scaffold(
      body: FutureBuilder<Widget>(
        future: _pageBuilderCompleter.future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return snapshot.data!;
          } else if (snapshot.hasError) {
            return Scaffold(
              body: Center(child: Text(snapshot.error.toString())),
            );
          } else {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
        },
      ),
    );
  }
}
