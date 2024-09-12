import 'package:flutter/material.dart';

import '../../core/enums/layout_enum.dart';
import '../widgets/modal_component.dart';

class PageLayout extends StatelessWidget {
  final String title;
  final String apiUrl;
  final Widget? skeleton;
  final List<ModalComponent>? modals;
  final List<Widget>? children;
  final LayoutEnum layout;

  const PageLayout({
    required this.title,
    required this.apiUrl,
    required this.layout,
    this.skeleton,
    this.modals,
    this.children,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
