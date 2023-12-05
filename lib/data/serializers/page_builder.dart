import 'package:flutter/material.dart';
import 'drawer_serializer.dart';
import 'file_input_serializer.dart';
import 'filled_button_serializer.dart';
import 'form_serializer.dart';
import 'grid_view_serializer.dart';
import 'list_view_serializer.dart';
import 'modal_serializer.dart';
import 'pages/drawer_page_serializer.dart';
import 'text_input_serializer.dart';
import 'text_serializer.dart';

class PageBuilder {
  static Widget fromJson(Map<String, dynamic> json) {
    final String type = json['type'];

    switch (type) {
      /// SECTION: Widgets
      case 'ListViewComponent':
        return ListViewSerializer.fromJson(json);
      case 'GridViewComponent':
        return GridViewSerializer.fromJson(json);
      case 'GridViewSkeleton':
        return GridViewSerializer.skeleton(json);
      case 'TextComponent':
        return TextSerializer.fromJson(json);
      case 'TextSkeleton':
        return TextSerializer.skeleton(json);
      case 'FormComponent':
        return FormSerializer.fromJson(json);
      case 'FormSkeleton':
        return FormSerializer.skeleton(json);
      case 'TextInputComponent':
        return TextInputSerializer.fromJson(json);
      case 'TextInputSkeleton':
        return TextInputSerializer.skeleton(json);
      case 'FileInputComponent':
        return FileInputSerializer.fromJson(json);
      case 'FileInputSkeleton':
        return FileInputSerializer.skeleton(json);
      case 'DrawerComponent':
        return DrawerSerializer.fromJson(json);
      case 'ModalComponent':
        return ModalSerializer.fromJson(json);

      /// SECTION: Pages
      case 'DrawerPage':
        return DrawerPageSerializer.fromJson(json);

      /// SECTION: Buttons
      case 'FilledButtonComponent':
        return FilledButtonSerializer.fromJson(json);

      default:
        return Container();
    }
  }
}
