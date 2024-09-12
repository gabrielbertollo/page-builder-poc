import 'package:flutter/material.dart';

import '../../view/widgets/grid_view_component.dart';

enum LayoutEnum {
  list,
  grid,
  column,
  row;

  String get name {
    return toString().split('.').last;
  }

  static LayoutEnum fromString(String name) {
    return LayoutEnum.values.firstWhere((e) => e.name == name);
  }

  static Widget wrap({
    required LayoutEnum layout,
    required List<Widget> children,
  }) {
    switch (layout) {
      case LayoutEnum.list:
        return ListView(children: children);
      case LayoutEnum.grid:
        return GridViewComponent(children: children);
      case LayoutEnum.column:
        return Column(children: children);
      case LayoutEnum.row:
        return Row(children: children);
      default:
        return Column(children: children);
    }
  }
}
