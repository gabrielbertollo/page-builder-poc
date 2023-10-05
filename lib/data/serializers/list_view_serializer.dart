import 'package:flutter/material.dart';
import 'page_builder.dart';
import '../../widgets/list_view_component.dart';

class ListViewSerializer {
  static Widget fromJson(Map<String, dynamic> json) {
    return ListViewComponent(
      children: json['children'] != null
          ? List<Widget>.from(
              json['children'].map((child) => PageBuilder.fromJson(child)))
          : [],
    );
  }
}
