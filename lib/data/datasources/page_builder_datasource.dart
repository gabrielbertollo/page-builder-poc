import 'package:flutter/material.dart';
import '../serializers/page_builder.dart';

class PageBuilderDatasource {
  Future<Widget> getPageBuilder() async {
    final Map<String, dynamic> response = {
      'type': 'FormComponent',
      'submitText': 'Submit',
      'children': [
        {
          'type': 'TextInputComponent',
          'label': 'Name',
          'initialValue': null,
          'required': true,
        },
        {
          'type': 'TextInputComponent',
          'label': 'Email',
          'initialValue': null,
          'required': true,
        },
        {
          'type': 'TextInputComponent',
          'label': 'Phone',
          'initialValue': null,
          'required': false,
        },
        {
          'type': 'FileInputComponent',
          'label': 'Resume',
          'initialValue': [
            'file1',
            'file2',
            'file3',
          ],
          'required': true,
        }
      ]
    };
    await Future.delayed(const Duration(seconds: 2));

    return PageBuilder.fromJson(response);
  }
}
