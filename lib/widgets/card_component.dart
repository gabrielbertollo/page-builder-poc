import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../core/helpers/material_theme_extension.dart';
import '../core/helpers/screen_size_extension.dart';
import '../data/action_handler.dart';

class CardComponent extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final String? iconUrl;
  final Map<String, dynamic> action;
  final Color? backgroundColor;
  final String? backgroundImageUrl;
  final String horizontalAlignment;
  final String verticalAlignment;
  final int horizontalSize;
  final num verticalSize;

  const CardComponent({
    required this.action,
    this.title,
    this.subtitle,
    this.iconUrl,
    this.backgroundColor,
    this.backgroundImageUrl,
    this.horizontalAlignment = 'start',
    this.verticalAlignment = 'start',
    this.horizontalSize = 1,
    this.verticalSize = 1,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final deviceTextScale = MediaQuery.of(context).textScaleFactor;
    return StaggeredGridTile.count(
      crossAxisCellCount: horizontalSize,
      mainAxisCellCount: verticalSize,
      child: Card(
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(12.0),
          onTap: () => ActionHandler.handleAction(action, context),
          child: Container(
            decoration: backgroundImageUrl != null
                ? BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    image: DecorationImage(
                      image: NetworkImage(
                        backgroundImageUrl!,
                      ),
                      fit: BoxFit.cover,
                    ),
                  )
                : null,
            child: LayoutBuilder(
              builder: (context, cardConstraints) {
                return Stack(
                  children: [
                    Positioned.fill(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.values.firstWhere(
                          (e) => e.name == horizontalAlignment,
                        ),
                        mainAxisAlignment: MainAxisAlignment.values.firstWhere(
                          (e) => e.name == verticalAlignment,
                        ),
                        children: [
                          if (iconUrl != null)
                            Flexible(
                              flex: verticalSize > 1 ? 8 : 4,
                              fit: FlexFit.tight,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                child: LayoutBuilder(
                                  builder: (context, iconConstraints) {
                                    return Image.network(
                                      iconUrl!,
                                      height: iconConstraints.maxHeight,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                    );
                                  },
                                ),
                              ),
                            ),
                          if (title != null)
                            Flexible(
                              flex: deviceTextScale > 1.0 ? 7 : 6,
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(
                                  18.0,
                                  iconUrl != null ? 0.0 : 16.0,
                                  18.0,
                                  subtitle != null ? 0.0 : 16.0,
                                ),
                                child: Text(
                                  title!,
                                  textAlign: TextAlign.values.firstWhere(
                                    (e) => e.name == horizontalAlignment,
                                  ),
                                  style: TextStyle(
                                    fontSize: () {
                                      if (context.isMobile) return 18.0;
                                      if (context.isTablet) return 20.0;
                                      if (context.isDesktop) return 22.0;
                                      return 18.0;
                                    }(),
                                    color: context.colorScheme.secondary,
                                  ),
                                ),
                              ),
                            ),
                          if (subtitle != null)
                            Padding(
                              padding: EdgeInsets.only(
                                right: 18.0,
                                left: 18.0,
                                top: title == null ? 8.0 * verticalSize : 0.0,
                                bottom: 8.0 * verticalSize,
                              ),
                              child: Text(
                                subtitle!,
                                textAlign: TextAlign.values.firstWhere(
                                  (e) => e.name == horizontalAlignment,
                                ),
                                style: TextStyle(
                                  fontSize: () {
                                    if (context.isMobile) return 18.0;
                                    if (context.isTablet) return 20.0;
                                    if (context.isDesktop) return 22.0;
                                    return 18.0;
                                  }(),
                                  color: context.colorScheme.secondary,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
