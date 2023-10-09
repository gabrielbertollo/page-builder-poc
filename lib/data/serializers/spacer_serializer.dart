import 'package:flutter/material.dart';

class SpacerSerializer {
  static Widget fromJson(Map<String, dynamic> json) {
    return SizedBox(
      height: json['height'],
      width: json['width'],
    );
  }
}
