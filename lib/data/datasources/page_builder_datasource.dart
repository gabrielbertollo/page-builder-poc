import 'package:flutter/material.dart';
import '../serializers/page_builder.dart';

class PageBuilderDatasource {
  Future<Widget> getPageBuilder() async {
    final Map<String, dynamic> response = {
      'type': 'GridViewComponent',
      'children': [
        {
          'type': 'CardComponent',
          'child': {
            'type': 'TextComponent',
            'text': 'Hello World',
            'fontSize': 14.0,
          },
        },
        {
          'type': 'CardComponent',
          'child': {
            'type': 'TextComponent',
            'text': 'Hello World',
            'fontSize': 14.0,
          },
        },
        {
          'type': 'CardComponent',
          'child': {
            'type': 'TextComponent',
            'text': 'Hello World',
            'fontSize': 14.0,
          },
        },
        {
          'type': 'CardComponent',
          'child': {
            'type': 'TextComponent',
            'text': 'Hello World',
            'fontSize': 14.0,
          },
        },
        {
          'type': 'CardComponent',
          'child': {
            'type': 'TextComponent',
            'text': 'Hello World',
            'fontSize': 14.0,
          },
        },
        {
          'type': 'CardComponent',
          'child': {
            'type': 'TextComponent',
            'text': 'Hello World',
            'fontSize': 14.0,
          },
        },
        {
          'type': 'TextComponent',
          'text': 'Hello World',
          'fontSize': 14.0,
        },
      ],
    };
    await Future.delayed(const Duration(seconds: 2));

    return PageBuilder.fromJson(response);
  }
}
