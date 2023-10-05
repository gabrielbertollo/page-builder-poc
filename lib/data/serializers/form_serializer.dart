import 'package:flutter/material.dart';

import '../../widgets/form_component.dart';
import 'page_builder.dart';

class FormSerializer {
  static Widget fromJson(Map<String, dynamic> json) {
    return FormComponent(
        children: json['children'] != null
            ? List<Widget>.from(
                json['children'].map((child) => PageBuilder.fromJson(child)))
            : []);
  }
}
