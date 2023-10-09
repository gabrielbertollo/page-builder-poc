import 'package:flutter/material.dart';
import '../serializers/page_builder.dart';

class PageBuilderDatasource {
  Future<Widget> getPageBuilder() async {
    final Map<String, dynamic> response = {
      'type': 'FormComponent',
      'children': [
        {
          'type': 'ButtonComponent',
          'label': 'Test your might',
          'action': {
            'type': 'modal',
            'child': {
              'type': 'ModalComponent',
              'title': 'Test your might',
              'description': 'Finish him!',
            }
          },
        },
        {
          'type': 'SpacerComponent',
          'height': 10,
        },
        {
          'type': 'ButtonComponent',
          'label': 'Go to test page',
          'action': {
            'type': 'navigation',
            'route': '/test',
          },
        }
      ]
    };
    await Future.delayed(const Duration(seconds: 2));

    return PageBuilder.fromJson(response);
  }
}
