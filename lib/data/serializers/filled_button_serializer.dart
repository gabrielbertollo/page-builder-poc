import 'package:flutter/material.dart';

import '../../view/widgets/buttons/filled_button_component.dart';
import 'actions/action_builder.dart';

class FilledButtonSerializer {
  static Widget fromJson(Map<String, dynamic> json) {
    return FilledButtonComponent(
      label: json['label'],
      icon: json['icon'],
      tonal: json['tonal'] ?? false,
      action: json['action'] != null
          ? ActionSerializer.fromJson(json['action'])
          : null,
    );
  }
}
