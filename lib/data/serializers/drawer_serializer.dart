import 'package:flutter/material.dart';

import '../../widgets/drawer_component.dart';

class DrawerSerializer {
  static Widget fromJson(Map<String, dynamic> json) {
    return const DrawerComponent();
  }
}
