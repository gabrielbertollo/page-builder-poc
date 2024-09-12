import 'package:flutter/material.dart';

import 'core/enums/layout_enum.dart';
import 'data/serializers/page_builder.dart';
import 'view/pages/drawer_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.purple,
      ),

      /// When using this implementation as a package, the routes should not
      /// be present here, but in the app that uses this package.
      routes: {
        '/builder': (context) {
          final args = ModalRoute.of(context)!.settings.arguments as Map?;
          if (args == null) {
            return const DrawerPage(
              title: 'Error',
              apiUrl: 'http://localhost:3000/error',
              layout: LayoutEnum.grid,
            );
          }
          final page = args['page'];
          return page;
        },
      },
      home: const DrawerPage(
        title: 'Home',
        apiUrl: 'http://localhost:3000/home',
        layout: LayoutEnum.grid,
      ),
    );
  }
}
