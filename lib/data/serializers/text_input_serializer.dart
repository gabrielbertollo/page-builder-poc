import 'package:flutter/material.dart';

import '../../view/widgets/text_input_component.dart';

class TextInputSerializer {
  static Widget fromJson(Map<String, dynamic> json) {
    return TextInputComponent(
      label: json['label'],
      initialValue: json['initialValue'],
      inputKey: GlobalKey<FormFieldState>(),
      isRequired: json['required'],
    );
  }

  static Widget skeleton(Map<String, dynamic> json) {
    return const TextInputSkeleton();
  }
}
