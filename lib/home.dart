import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data/repository/page_builder_repository.dart';

class HomeProvider extends ChangeNotifier {
  final String requestUrl;

  final PageBuilderRepository _pageBuilderRepository = PageBuilderRepository();

  final ValueNotifier<bool> _isLoading = ValueNotifier<bool>(true);
  final ValueNotifier<bool> _isLoaded = ValueNotifier<bool>(false);
  final ValueNotifier<String?> _error = ValueNotifier<String?>(null);
  final ValueNotifier<Widget> _child = ValueNotifier<Widget>(Container());

  HomeProvider({
    required this.requestUrl,
  }) {
    loadPageBuilder(requestUrl);
  }

  ValueNotifier<bool> get isLoading => _isLoading;
  ValueNotifier<bool> get isLoaded => _isLoaded;
  ValueNotifier<String?> get error => _error;
  ValueNotifier<Widget> get child => _child;

  Future<void> loadPageBuilder(String url) async {
    try {
      _child.value = await _pageBuilderRepository.getPageBuilder(url);
    } catch (e) {
      _error.value = e.toString();
    } finally {
      _isLoading.value = false;
      _isLoaded.value = true;
      notifyListeners();
    }
  }

  void refresh() {
    _isLoading.value = true;
    _isLoaded.value = false;
    notifyListeners();
    loadPageBuilder(requestUrl);
  }
}

class Home extends StatelessWidget {
  final String? requestUrl;
  final Widget? skeleton;

  const Home({
    this.requestUrl,
    this.skeleton,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => HomeProvider(
          requestUrl: requestUrl ?? 'http://localhost:3000/home',
        ),
        child: Consumer<HomeProvider>(
          builder: (context, provider, child) {
            if (provider.isLoading.value) {
              return skeleton ??
                  const Scaffold(
                    body: Center(child: CircularProgressIndicator()),
                  );
            } else if (provider.error.value != null) {
              return Scaffold(
                body: Center(child: Text(provider.error.value!)),
              );
            } else {
              return provider.child.value;
            }
          },
        ),
      ),
    );
  }
}
