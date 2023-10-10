import 'package:flutter/material.dart';

import '../../../widgets/pages/searchable_page.dart';
import '../page_builder.dart';

class SearchablePageSerializer {
  static Widget fromJson(Map<String, dynamic> json) {
    return SearchablePage(
      title: PageBuilder.fromJson(json['title']),
      body: PageBuilder.fromJson(json['body']),
    );
  }
}
