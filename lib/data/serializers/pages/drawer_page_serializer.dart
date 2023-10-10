import 'package:flutter/material.dart';

import '../../../widgets/pages/drawer_page.dart';
import '../page_builder.dart';

class DrawerPageSerializer {
  static Widget fromJson(Map<String, dynamic> json) {
    return DrawerPage(
      title: PageBuilder.fromJson(json['title']),
      drawer: PageBuilder.fromJson(json['drawer']),
      body: PageBuilder.fromJson(json['body']),
    );
  }
}
