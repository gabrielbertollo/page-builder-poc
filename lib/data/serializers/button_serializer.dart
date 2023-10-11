import 'package:flutter/material.dart';

import '../../widgets/button_component.dart';

class ButtonSerializer {
  static Widget fromJson(Map<String, dynamic> json) {
    return ButtonComponent(
      label: json['label'],
      action: json['action'],
    );
  }

  static Widget skeleton(Map<String, dynamic> json) {
    return ButtonSkeleton(
      characterLength: json['characterLength'] ?? 100,
    );
  }
}
