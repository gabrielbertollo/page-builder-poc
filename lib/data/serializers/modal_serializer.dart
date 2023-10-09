import 'package:flutter/material.dart';

import '../../widgets/modal_component.dart';

class ModalSerializer {
  static Widget fromJson(Map<String, dynamic> json) {
    return ModalComponent(
      title: json['title'],
      description: json['description'],
    );
  }
}
