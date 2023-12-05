import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'page_layout.dart';
import 'page_provider.dart';

class DrawerPage extends PageLayout {
  final Widget? drawer;

  const DrawerPage({
    required super.title,
    required super.body,
    super.modals,
    this.drawer,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PageProvider(
        title: title,
        body: body,
        modals: modals,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        drawer: drawer,
        body: body,
      ),
    );
  }
}
