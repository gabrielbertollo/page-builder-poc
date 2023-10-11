import 'dart:developer';

import 'package:flutter/material.dart';

import '../widgets/modal_component.dart';

enum Action {
  modal,
  navigation;

  static Action? fromString(String action) {
    switch (action) {
      case 'modal':
        return Action.modal;
      case 'navigation':
        return Action.navigation;
      default:
        return null;
    }
  }
}

class ActionHandler {
  static void handleAction(Map<String, dynamic> data, BuildContext context) {
    final action = Action.fromString(data['type']);
    final child = data['child'];

    switch (action) {
      case Action.modal:
        showDialog(
          context: context,
          builder: (context) {
            return ModalComponent(
              title: child['title'],
              description: child['description'],
            );
          },
        );
        break;
      case Action.navigation:
        log('Navigate to ${data['route']}');
        Navigator.pushNamed(context, data['route'], arguments: {
          'requestUrl': data['requestUrl'],
          'skeleton': data['skeleton'],
        });
        break;
      default:
        log('Unknown action');
    }
  }
}
