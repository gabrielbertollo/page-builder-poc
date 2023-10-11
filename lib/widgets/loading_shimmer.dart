import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../core/helpers/material_theme_extension.dart';

class LoadingShimmer extends StatelessWidget {
  final Widget child;

  const LoadingShimmer({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: context.colorScheme.onSurfaceVariant.withOpacity(0.1),
      highlightColor: context.colorScheme.onSurfaceVariant.withOpacity(0.5),
      child: child,
    );
  }
}
