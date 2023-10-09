import 'package:flutter/material.dart';
import '../../widgets/card_component.dart';

class CardSerializer {
  static Widget fromJson(Map<String, dynamic> json) {
    return CardComponent(
      title: json['title'],
      subtitle: json['subtitle'],
      iconUrl: json['iconUrl'],
      action: json['action'],
      backgroundColor: json['color'] != null ? Color(json['color']) : null,
      backgroundImageUrl: json['backgroundImageUrl'],
      horizontalAlignment: json['horizontalAlignment'] ?? 'start',
      verticalAlignment: json['verticalAlignment'] ?? 'center',
      verticalSize: json['verticalSize'] ?? 1,
      horizontalSize: json['horizontalSize'] ?? 1,
    );
  }
}
