import 'package:flutter/material.dart';

import '../../view/widgets/file_input_component.dart';

class FileInputSerializer {
  static Widget fromJson(Map<String, dynamic> json) {
    return FileInputComponent(
      label: json['label'],
      initialValue: json['initialValue'],
      inputKey: GlobalKey<FormFieldState>(),
      isRequired: json['required'],
    );
  }

  static Widget skeleton(Map<String, dynamic> json) {
    return const FileInputSkeleton();
  }
}
