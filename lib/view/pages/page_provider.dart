import 'package:flutter/material.dart';

import '../../data/repository/page_builder_repository.dart';
import 'page_layout.dart';

class PageProvider extends ChangeNotifier {
  final PageBuilderRepository _pageBuilderRepository = PageBuilderRepository();

  PageLayout page;
  final ValueNotifier<PageLayout?> pageNotifier =
      ValueNotifier<PageLayout?>(null);
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(true);
  final ValueNotifier<bool> isLoaded = ValueNotifier<bool>(false);
  final ValueNotifier<String?> error = ValueNotifier<String?>(null);

  PageProvider(this.page) {
    pageNotifier.value = page;
    bodyBuilder(page.apiUrl);
  }

  Future<void> bodyBuilder(String url) async {
    try {
      pageNotifier.value =
          await _pageBuilderRepository.getPageBuilder(url) as PageLayout;
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
      isLoaded.value = true;
      notifyListeners();
    }
  }

  void refresh() {
    isLoading.value = true;
    isLoaded.value = false;
    notifyListeners();
    bodyBuilder(page.apiUrl);
  }
}
