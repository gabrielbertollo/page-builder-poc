import 'package:flutter/material.dart';

class PageProvider extends ChangeNotifier {
  final String title;
  final Widget body;
  final Map<String, Widget>? modals;

  PageProvider({
    required this.title,
    required this.body,
    this.modals,
  });

  void refresh() {
    notifyListeners();
  }
}
