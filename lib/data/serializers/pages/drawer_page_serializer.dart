import 'package:flutter/material.dart';

import '../../../core/enums/layout_enum.dart';
import '../../../view/pages/drawer_page.dart';
import '../../../view/widgets/modal_component.dart';
import '../page_builder.dart';

class DrawerPageSerializer {
  static Widget fromJson(Map<String, dynamic> json) {
    return DrawerPage(
      title: json['title'],
      apiUrl: json['apiUrl'],
      layout: LayoutEnum.fromString(json['layout']),
      children: json['children']?.map<Widget>((child) {
            return PageBuilder.fromJson(child);
          }).toList() ??
          [],
      drawer:
          json['drawer'] != null ? PageBuilder.fromJson(json['drawer']) : null,
      modals: json['modals'] != null
          ? (json['modals'] as Iterable)
              .map((e) => PageBuilder.fromJson(e) as ModalComponent)
              .toList()
          : null,
    );
  }
}
