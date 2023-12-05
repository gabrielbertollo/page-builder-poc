import 'package:flutter/material.dart';

import '../../view/widgets/modal_component.dart';
import 'form_serializer.dart';
import 'page_builder.dart';

class ModalSerializer {
  static Widget fromJson(Map<String, dynamic> json) {
    return ModalComponent(
      title: json['title'],
      children: json['children']?.map<Widget>((child) {
            return PageBuilder.fromJson(child);
          }).toList() ??
          [],
      form: json['form'] != null ? FormSerializer.fromJson(json['form']) : null,
      actions: json['actions']?.map<Widget>((action) {
        return PageBuilder.fromJson(action);
      }).toList(),
    );
  }
}
