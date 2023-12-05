import 'package:flutter/material.dart';

import '../../view/widgets/text_component.dart';

class TextSerializer {
  static Widget fromJson(Map<String, dynamic> json) {
    return TextComponent(
      json['text'],
      fontSize: json['fontSize'],
    );
  }

  static Widget skeleton(Map<String, dynamic> json) {
    return TextComponentSkeleton(
      characterLength: json['characterLength'] ?? 100,
      fontSize: json['fontSize'] ?? 20,
    );
  }
}
