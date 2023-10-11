import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../serializers/page_builder.dart';

class PageBuilderDatasource {
  Future<Widget> getPageBuilder(String url) async {
    await Future.delayed(const Duration(seconds: 1));
    final response = await Dio().get(url);

    return PageBuilder.fromJson(response.data);
  }
}
