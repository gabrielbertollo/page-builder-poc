import 'package:flutter/material.dart';

import '../../../view/pages/drawer_page.dart';
import '../page_builder.dart';

class DrawerPageSerializer {
  static Widget fromJson(Map<String, dynamic> json) {
    return DrawerPage(
        title: json['title'],
        drawer: json['drawer'] != null
            ? PageBuilder.fromJson(json['drawer'])
            : null,
        body: PageBuilder.fromJson(json['body']),
        modals: json['modals'] != null
            ? Map<String, Widget>.fromEntries(
                (json['modals'] as List<dynamic>).map(
                  (entry) => MapEntry(
                    entry.keys.first,
                    PageBuilder.fromJson(
                      entry.values.first,
                    ),
                  ),
                ),
              )
            : null);
  }
}

// "modals": [
//             {
//                 "add-user": {
//                     "type": "ModalComponent",
//                     "title": "Adicionar Usuário",
//                     "body": {
//                         "type": "AddUserForm"
//                     }
//                 }
//             }
//         ]
