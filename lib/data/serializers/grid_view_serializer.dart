import 'package:flutter/material.dart';
import 'page_builder.dart';
import '../../widgets/grid_view_component.dart';

class GridViewSerializer {
  static Widget fromJson(Map<String, dynamic> json) {
    return GridViewComponent(
      children: json['children'] != null
          ? List<Widget>.from(
              json['children'].map((child) => PageBuilder.fromJson(child)))
          : [],
    );
  }
}
