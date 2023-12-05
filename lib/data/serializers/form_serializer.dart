import 'package:flutter/material.dart';

import '../../view/widgets/form_component.dart';
import 'page_builder.dart';

class FormSerializer {
  static FormComponent fromJson(Map<String, dynamic> json) {
    return FormComponent(
      id: json['id'],
      action: json['action'],
      method: json['method'],
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
