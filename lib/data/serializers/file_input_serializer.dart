import 'package:flutter/material.dart';

import '../../widgets/file_input_component.dart';

class FileInputSerializer {
  static Widget fromJson(Map<String, dynamic> json) {
    return FileInputComponent(
      label: json['label'],
      initialValue: json['initialValue'],
      inputKey: GlobalKey<FormFieldState>(),
      isRequired: json['required'],
    );
  }
}
