import 'package:flutter/material.dart';
import 'card_serializer.dart';
import 'grid_view_serializer.dart';
import 'list_view_serializer.dart';
import 'text_serializer.dart';

class PageBuilder {
  static Widget fromJson(Map<String, dynamic> json) {
    final String type = json['type'];

    switch (type) {
      case 'ListViewComponent':
        return ListViewSerializer.fromJson(json);
      case 'GridViewComponent':
        return GridViewSerializer.fromJson(json);
      case 'CardComponent':
        return CardSerializer.fromJson(json);
      case 'TextComponent':
        return TextSerializer.fromJson(json);
      default:
        return Container();
    }
  }
}
