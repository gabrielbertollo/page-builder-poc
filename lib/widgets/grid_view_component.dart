import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../core/helpers/screen_size_extension.dart';

class GridViewComponent extends StatelessWidget {
  final List<Widget> children;
  final int? columnCount;
  final int minColumnCount;
  final double cardScale;

  const GridViewComponent({
    this.children = const [],
    this.columnCount,
    this.minColumnCount = 2,
    this.cardScale = 225.0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: () {
          if (context.width > 1220.0) {
            return (context.width - 1200.0) / 2;
          }
          return 10.0;
        }(),
      ),
      child: StaggeredGrid.count(
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        crossAxisCount: columnCount ??
            () {
              /// context.width ~/ 225 is a way to get the ideal
              /// number of columns for the current screen width
              /// based on the ideal card width of 225.0
              ///
              /// TODO refactor to move this out?
              if (context.width ~/ cardScale >= children.length) {
                /// This is here because [cards.length] is not
                /// a const so it cant be used in the switch
                ///
                /// TODO refactor to move this out?
                return children.length;
              }
              return switch (context.width ~/ cardScale) {
                <= 1 => minColumnCount,
                >= 6 => 6,
                _ => context.width ~/ cardScale,
              };
            }(),
        children: children,
      ),
    );
  }
}
