import 'package:flutter/material.dart';

import '../../widgets/modal_component.dart';
import 'page_builder.dart';

class ModalSerializer {
  static Widget fromJson(Map<String, dynamic> json) {
    return ModalComponent(
      title: PageBuilder.fromJson(json['title']),
      content: json['content'] != null
          ? PageBuilder.fromJson(json['content'])
          : null,
      actions: json['actions']?.map<Widget>((action) {
        return PageBuilder.fromJson(action);
      }).toList(),
    );
  }
}
