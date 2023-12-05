import 'package:flutter/material.dart';
import 'page_builder.dart';
import '../../view/widgets/grid_view_component.dart';

class GridViewSerializer {
  static Widget fromJson(Map<String, dynamic> json) {
    return GridViewComponent(
      columnCount: json['columnCount'],
      minColumnCount: json['minColumnCount'] ?? 2,
      cardScale: json['cardScale'] ?? 225.0,
      children: json['children'] != null
          ? List<Widget>.from(
              json['children'].map((child) => PageBuilder.fromJson(child)))
          : [],
    );
  }

  static Widget skeleton(Map<String, dynamic> json) {
    return GridViewComponentSkeleton(
      columnCount: json['columnCount'],
      minColumnCount: json['minColumnCount'] ?? 2,
      cardScale: json['cardScale'] ?? 225.0,
      content: PageBuilder.fromJson(json['content']),
    );
  }
}
