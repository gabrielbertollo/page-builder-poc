import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/enums/layout_enum.dart';
import 'page_layout.dart';
import 'page_provider.dart';

class DrawerPage extends PageLayout {
  /// Drawer is not a realistic example because it will not be present in any
  /// other page but the home page, but it is a good example of a custom
  /// parameter will work on `PageLayout` extending classes.
  final Widget? drawer;

  const DrawerPage({
    required super.title,
    required super.apiUrl,
    required super.layout,
    super.skeleton,
    super.modals,
    super.children,
    this.drawer,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PageProvider(this),
      child: Consumer<PageProvider>(
        builder: (context, provider, child) {
          return Scaffold(
            appBar: AppBar(
              title: ValueListenableBuilder(
                valueListenable: provider.pageNotifier,
                builder: (context, value, child) {
                  return Text(value!.title);
                },
              ),
            ),
            drawer: drawer,
            body: ValueListenableBuilder(
              valueListenable: provider.pageNotifier,
              builder: (context, value, child) {
                if (provider.isLoading.value) {
                  return skeleton ??
                      const Center(child: CircularProgressIndicator());
                } else if (provider.error.value != null) {
                  return Center(child: Text(provider.error.value!));
                } else if (provider.isLoaded.value) {
                  return LayoutEnum.wrap(
                    layout: value!.layout,
                    children: value.children!,
                  );
                } else {
                  return Container();
                }
              },
            ),
          );
        },
      ),
    );
  }
}
