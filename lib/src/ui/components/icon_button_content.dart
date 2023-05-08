
import 'package:flutter/material.dart';

class IconButtonContent extends StatelessWidget {
  const IconButtonContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        children: const <Widget>[
          Spacer(),
          IconTypesGroup(enabled: true),
          IconTypesGroup(enabled: false),
          Spacer(),
        ],
      ),
    );
  }
}

class IconTypesGroup extends StatelessWidget {
  const IconTypesGroup({super.key, required this.enabled});

  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final VoidCallback? onPressed = enabled ? () {} : null;
    final ColorScheme colors = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
              icon: const Icon(Icons.filter_drama), onPressed: onPressed),

          // Use a standard IconButton with specific style to implement the
          // 'Filled' type.
          IconButton(
              icon: const Icon(Icons.filter_drama),
              onPressed: onPressed,
              style: IconButton.styleFrom(
                foregroundColor: colors.onPrimary,
                backgroundColor: colors.primary,
                disabledBackgroundColor: colors.onSurface.withOpacity(0.12),
                hoverColor: colors.onPrimary.withOpacity(0.08),
                focusColor: colors.onPrimary.withOpacity(0.12),
                highlightColor: colors.onPrimary.withOpacity(0.12),
              )),

          // Use a standard IconButton with specific style to implement the
          // 'Filled Tonal' type.
          IconButton(
            icon: const Icon(Icons.filter_drama),
            onPressed: onPressed,
            style: IconButton.styleFrom(
              foregroundColor: colors.onSecondaryContainer,
              backgroundColor: colors.secondaryContainer,
              disabledBackgroundColor: colors.onSurface.withOpacity(0.12),
              hoverColor: colors.onSecondaryContainer.withOpacity(0.08),
              focusColor: colors.onSecondaryContainer.withOpacity(0.12),
              highlightColor: colors.onSecondaryContainer.withOpacity(0.12),
            ),
          ),

          // Use a standard IconButton with specific style to implement the
          // 'Outlined' type.
          IconButton(
            icon: const Icon(Icons.filter_drama),
            onPressed: onPressed,
            style: IconButton.styleFrom(
              focusColor: colors.onSurfaceVariant.withOpacity(0.12),
              highlightColor: colors.onSurface.withOpacity(0.12),
              side: onPressed == null
                  ? BorderSide(
                  color: Theme.of(context)
                      .colorScheme
                      .onSurface
                      .withOpacity(0.12))
                  : BorderSide(color: colors.outline),
            ).copyWith(
              foregroundColor: MaterialStateProperty.resolveWith(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed)) {
                      return colors.onSurface;
                    }
                    return null;
                  }),
            ),
          ),
        ],
      ),
    );
  }
}