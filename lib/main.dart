import 'package:flutter/material.dart';
import 'home.dart';

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
        '/builder': (context) => const Home(),
      },
      home: const Home(),
    );
  }
}
