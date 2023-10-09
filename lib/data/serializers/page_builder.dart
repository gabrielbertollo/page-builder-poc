import 'package:flutter/material.dart';
import 'button_serializer.dart';
import 'card_serializer.dart';
import 'file_input_serializer.dart';
import 'form_serializer.dart';
import 'grid_view_serializer.dart';
import 'list_view_serializer.dart';
import 'spacer_serializer.dart';
import 'text_input_serializer.dart';
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
      case 'FormComponent':
        return FormSerializer.fromJson(json);
      case 'TextInputComponent':
        return TextInputSerializer.fromJson(json);
      case 'FileInputComponent':
        return FileInputSerializer.fromJson(json);
      case 'ButtonComponent':
        return ButtonSerializer.fromJson(json);
      case 'SpacerComponent':
        return SpacerSerializer.fromJson(json);
      default:
        return Container();
    }
  }
}
