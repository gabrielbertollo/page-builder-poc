import 'package:flutter/material.dart';
import 'page_builder.dart';
import '../../widgets/card_component.dart';

class CardSerializer {
  static Widget fromJson(Map<String, dynamic> json) {
    return CardComponent(
      color: json['color'] != null ? Color(json['color']) : null,
      child: PageBuilder.fromJson(json['child']),
    );
  }
}
