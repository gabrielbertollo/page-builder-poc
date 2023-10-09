import 'package:flutter/material.dart';
import '../serializers/page_builder.dart';

class PageBuilderDatasource {
  Future<Widget> getPageBuilder() async {
    final Map<String, dynamic> response = {
      'type': 'GridViewComponent',
      // 'crossAxisCount': 3,
      'children': [
        {
          'type': 'CardComponent',
          'title': 'Transparência',
          'iconUrl': 'https://cdn-icons-png.flaticon.com/512/2838/2838912.png',
          'action': {
            'type': 'navigation',
            'route': '/media',
          },
        },
        {
          'type': 'CardComponent',
          'title': 'Ouvidoria',
          'subtitle': 'Algum problema?',
          'iconUrl': 'https://cdn-icons-png.flaticon.com/512/2838/2838912.png',
          'verticalSize': 2,
          'horizontalSize': 2,
          'horizontalAlignment': 'center',
          'action': {
            'type': 'navigation',
            'route': '/cards',
          },
        },
        {
          'type': 'CardComponent',
          'title': 'Blog',
          'iconUrl': 'https://cdn-icons-png.flaticon.com/512/2838/2838912.png',
          'action': {
            'type': 'navigation',
            'route': '/blog',
          },
        },
        {
          'type': 'CardComponent',
          'title': 'Conheça a Cidade',
          'iconUrl': 'https://cdn-icons-png.flaticon.com/512/2838/2838912.png',
          'action': {
            'type': 'navigation',
            'route': '/blog/conheca-a-cidade',
          },
        },
        {
          'type': 'CardComponent',
          'title': 'Arrume um emprego',
          'subtitle': 'no LinkedIn',
          'iconUrl': 'https://cdn-icons-png.flaticon.com/512/2838/2838912.png',
          'action': {
            'type': 'navigation',
            'route': '/webview',
          },
        },
        {
          'type': 'CardComponent',
          'title': 'Alertas',
          'iconUrl': 'https://cdn-icons-png.flaticon.com/512/2838/2838912.png',
          'action': {
            'type': 'navigation',
            'route': '/page6',
          },
        },
        {
          'type': 'CardComponent',
          'title': 'Nível dos Rios',
          'iconUrl': 'https://cdn-icons-png.flaticon.com/512/2838/2838912.png',
          'action': {
            'type': 'navigation',
            'route': '/page7',
          },
        },
        {
          'type': 'CardComponent',
          'title': 'Card 2',
          'subtitle': 'Subtitle 2',
          'iconUrl': 'https://cdn-icons-png.flaticon.com/512/2838/2838912.png',
          'action': {
            'type': 'navigation',
            'route': '/page8',
          },
        },
        {
          'type': 'CardComponent',
          'title': 'Card 2',
          'subtitle': 'Subtitle 2',
          'iconUrl': 'https://cdn-icons-png.flaticon.com/512/2838/2838912.png',
          'action': {
            'type': 'navigation',
            'route': '/page9',
          },
        },
        {
          'type': 'CardComponent',
          'title': 'Card 2',
          'subtitle': 'Subtitle 2',
          'iconUrl': 'https://cdn-icons-png.flaticon.com/512/2838/2838912.png',
          'action': {
            'type': 'navigation',
            'route': '/page10',
          },
        },
        {
          'type': 'CardComponent',
          'title': 'Card 2',
          'subtitle': 'Subtitle 2',
          'iconUrl': 'https://cdn-icons-png.flaticon.com/512/2838/2838912.png',
          'action': {
            'type': 'navigation',
            'route': '/page11',
          },
        },
        {
          'type': 'CardComponent',
          'title': 'Card 2',
          'subtitle': 'Subtitle 2',
          'iconUrl': 'https://cdn-icons-png.flaticon.com/512/2838/2838912.png',
          'action': {
            'type': 'navigation',
            'route': '/page12',
          },
        },
        {
          'type': 'CardComponent',
          'title': 'Card 2',
          'subtitle': 'Subtitle 2',
          'iconUrl': 'https://cdn-icons-png.flaticon.com/512/2838/2838912.png',
          'action': {
            'type': 'navigation',
            'route': '/page13',
          },
        },
        {
          'type': 'CardComponent',
          'title': 'Card 2',
          'subtitle': 'Subtitle 2',
          'iconUrl': 'https://cdn-icons-png.flaticon.com/512/2838/2838912.png',
          'action': {
            'type': 'navigation',
            'route': '/page14',
          },
        },
      ]
    };
    await Future.delayed(const Duration(seconds: 2));

    return PageBuilder.fromJson(response);
  }
}
