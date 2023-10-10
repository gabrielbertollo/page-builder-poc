import 'package:flutter/material.dart';

import '../core/helpers/material_theme_extension.dart';
import '../data/action_handler.dart';

class PostComponent extends StatelessWidget {
  final Widget title;
  final String imageUrl;
  final String? publishedAt;
  final String? actionText;
  final Map<String, dynamic> action;

  const PostComponent({
    required this.title,
    required this.imageUrl,
    required this.action,
    this.publishedAt,
    this.actionText = 'Leia mais',
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Card(
        elevation: 0,
        color: context.colorScheme.surfaceVariant,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: InkWell(
          onTap: () => ActionHandler.handleAction(action, context),
          overlayColor: MaterialStateProperty.all(
            context.colorScheme.onSurfaceVariant.withOpacity(0.1),
          ),
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 3 / 2,
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(12.0),
                  ),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    loadingBuilder: (
                      BuildContext context,
                      Widget child,
                      ImageChunkEvent? loadingProgress,
                    ) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    title,
                    const SizedBox(height: 4.0),
                    if (publishedAt != null)
                      Text(
                        publishedAt!,
                        style: TextStyle(
                          color: context.colorScheme.onSurfaceVariant,
                          fontSize: 12,
                        ),
                      ),
                    const SizedBox(height: 16.0),
                    Align(
                      alignment: Alignment.centerRight,
                      child: FilledButton(
                        onPressed: () =>
                            ActionHandler.handleAction(action, context),
                        child: Text(actionText!),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
