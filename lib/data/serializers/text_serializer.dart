import 'package:flutter/material.dart';

class TextSerializer {
  static Widget fromJson(Map<String, dynamic> json) {
    return Text(
      json['text'],
      style: TextStyle(
        fontSize: json['fontSize'],
      ),
    );
  }
}
