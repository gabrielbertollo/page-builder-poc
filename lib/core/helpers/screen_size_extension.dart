import 'package:flutter/material.dart';

extension ScreenSize on BuildContext {
  bool get isLargeDesktop => MediaQuery.of(this).size.width > 1200;
  bool get isDesktop => MediaQuery.of(this).size.width > 800;
  bool get isTablet => MediaQuery.of(this).size.width > 600;
  bool get isMobile => MediaQuery.of(this).size.width < 600;

  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
}
