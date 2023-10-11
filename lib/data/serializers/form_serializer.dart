import 'package:flutter/material.dart';

import '../../widgets/form_component.dart';
import 'page_builder.dart';

class FormSerializer {
  static Widget fromJson(Map<String, dynamic> json) {
    return FormComponent(
      formKey: GlobalKey<FormState>(),
      submitText: json['submitText'] as String? ?? 'Submit',
      children: json['children'] != null
          ? List<Widget>.from(
              json['children'].map((child) => PageBuilder.fromJson(child)))
          : [],
    );
  }

  static Widget skeleton(Map<String, dynamic> json) {
    return FormSkeleton(
      children: json['children'] != null
          ? List<Widget>.from(
              json['children'].map((child) => PageBuilder.fromJson(child)))
          : [],
    );
  }
}
