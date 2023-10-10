import 'package:flutter/material.dart';

import '../../widgets/post_component.dart';
import 'page_builder.dart';

class PostSerializer {
  static Widget fromJson(Map<String, dynamic> json) {
    return PostComponent(
      title: PageBuilder.fromJson(json['title']),
      imageUrl: json['imageUrl'],
      action: json['action'],
      actionText: json['actionText'] ?? 'Leia mais',
      publishedAt: json['publishedAt'],
    );
  }
}
