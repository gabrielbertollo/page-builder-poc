import 'package:flutter/material.dart';
import 'data/serializers/page_builder.dart';
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
        '/builder': (context) {
          final args = ModalRoute.of(context)!.settings.arguments as Map?;
          return Home(
            requestUrl: args?['requestUrl'],
            skeleton: args?['skeleton'] != null
                ? PageBuilder.fromJson(args?['skeleton'])
                : null,
          );
        },
      },
      home: const Home(),
    );
  }
}
