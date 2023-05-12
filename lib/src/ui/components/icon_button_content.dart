import 'package:flutter/material.dart';

class IconButtonContent extends StatelessWidget {
  const IconButtonContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("Icon Buttons", style: Theme.of(context).textTheme.titleMedium),
        const Padding(
          padding: EdgeInsets.all(4.0),
          child: Row(
            children: <Widget>[
              Spacer(),
              IconTypesGroup(enabled: true),
              IconTypesGroup(enabled: false),
              Spacer(),
            ],
          ),
        ),
      ],
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
        mainAxisSize: MainAxisSize.min,
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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

class IconButtonToggleContent extends StatefulWidget {
  const IconButtonToggleContent({super.key});

  @override
  State<IconButtonToggleContent> createState() =>
      _IconButtonToggleContentState();
}

class _IconButtonToggleContentState extends State<IconButtonToggleContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Icon Button Toggles", style: Theme.of(context).textTheme.titleMedium),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // Standard IconButton
                    children: <Widget>[
                      DemoIconToggleButton(isEnabled: true),
                      SizedBox(width: 10),
                      DemoIconToggleButton(isEnabled: false),
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // Filled IconButton
                      DemoIconToggleButton(
                        isEnabled: true,
                        getDefaultStyle: enabledFilledButtonStyle,
                      ),
                      SizedBox(width: 10),
                      DemoIconToggleButton(
                        isEnabled: false,
                        getDefaultStyle: disabledFilledButtonStyle,
                      )
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // Filled Tonal IconButton
                      DemoIconToggleButton(
                        isEnabled: true,
                        getDefaultStyle: enabledFilledTonalButtonStyle,
                      ),
                      SizedBox(width: 10),
                      DemoIconToggleButton(
                        isEnabled: false,
                        getDefaultStyle: disabledFilledTonalButtonStyle,
                      ),
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // Outlined IconButton
                      DemoIconToggleButton(
                        isEnabled: true,
                        getDefaultStyle: enabledOutlinedButtonStyle,
                      ),
                      SizedBox(width: 10),
                      DemoIconToggleButton(
                        isEnabled: false,
                        getDefaultStyle: disabledOutlinedButtonStyle,
                      ),
                    ]),
              ]),
        ),
      ],
    );
  }
}

class DemoIconToggleButton extends StatefulWidget {
  const DemoIconToggleButton(
      {required this.isEnabled, this.getDefaultStyle, super.key});

  final bool isEnabled;
  final ButtonStyle? Function(bool, ColorScheme)? getDefaultStyle;

  @override
  State<DemoIconToggleButton> createState() => _DemoIconToggleButtonState();
}

class _DemoIconToggleButtonState extends State<DemoIconToggleButton> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;
    final VoidCallback? onPressed = widget.isEnabled
        ? () {
            setState(() {
              selected = !selected;
            });
          }
        : null;
    ButtonStyle? style;
    if (widget.getDefaultStyle != null) {
      style = widget.getDefaultStyle!(selected, colors);
    }

    return IconButton(
      isSelected: selected,
      icon: const Icon(Icons.settings_outlined),
      selectedIcon: const Icon(Icons.settings),
      onPressed: onPressed,
      style: style,
    );
  }
}

ButtonStyle enabledFilledButtonStyle(bool selected, ColorScheme colors) {
  return IconButton.styleFrom(
    foregroundColor: selected ? colors.onPrimary : colors.primary,
    backgroundColor: selected ? colors.primary : colors.surfaceVariant,
    disabledForegroundColor: colors.onSurface.withOpacity(0.38),
    disabledBackgroundColor: colors.onSurface.withOpacity(0.12),
    hoverColor: selected
        ? colors.onPrimary.withOpacity(0.08)
        : colors.primary.withOpacity(0.08),
    focusColor: selected
        ? colors.onPrimary.withOpacity(0.12)
        : colors.primary.withOpacity(0.12),
    highlightColor: selected
        ? colors.onPrimary.withOpacity(0.12)
        : colors.primary.withOpacity(0.12),
  );
}

ButtonStyle disabledFilledButtonStyle(bool selected, ColorScheme colors) {
  return IconButton.styleFrom(
    disabledForegroundColor: colors.onSurface.withOpacity(0.38),
    disabledBackgroundColor: colors.onSurface.withOpacity(0.12),
  );
}

ButtonStyle enabledFilledTonalButtonStyle(bool selected, ColorScheme colors) {
  return IconButton.styleFrom(
    foregroundColor:
        selected ? colors.onSecondaryContainer : colors.onSurfaceVariant,
    backgroundColor:
        selected ? colors.secondaryContainer : colors.surfaceVariant,
    hoverColor: selected
        ? colors.onSecondaryContainer.withOpacity(0.08)
        : colors.onSurfaceVariant.withOpacity(0.08),
    focusColor: selected
        ? colors.onSecondaryContainer.withOpacity(0.12)
        : colors.onSurfaceVariant.withOpacity(0.12),
    highlightColor: selected
        ? colors.onSecondaryContainer.withOpacity(0.12)
        : colors.onSurfaceVariant.withOpacity(0.12),
  );
}

ButtonStyle disabledFilledTonalButtonStyle(bool selected, ColorScheme colors) {
  return IconButton.styleFrom(
    disabledForegroundColor: colors.onSurface.withOpacity(0.38),
    disabledBackgroundColor: colors.onSurface.withOpacity(0.12),
  );
}

ButtonStyle enabledOutlinedButtonStyle(bool selected, ColorScheme colors) {
  return IconButton.styleFrom(
    backgroundColor: selected ? colors.inverseSurface : null,
    hoverColor: selected
        ? colors.onInverseSurface.withOpacity(0.08)
        : colors.onSurfaceVariant.withOpacity(0.08),
    focusColor: selected
        ? colors.onInverseSurface.withOpacity(0.12)
        : colors.onSurfaceVariant.withOpacity(0.12),
    highlightColor: selected
        ? colors.onInverseSurface.withOpacity(0.12)
        : colors.onSurface.withOpacity(0.12),
    side: BorderSide(color: colors.outline),
  ).copyWith(
    foregroundColor:
        MaterialStateProperty.resolveWith((Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return colors.onInverseSurface;
      }
      if (states.contains(MaterialState.pressed)) {
        return colors.onSurface;
      }
      return null;
    }),
  );
}

ButtonStyle disabledOutlinedButtonStyle(bool selected, ColorScheme colors) {
  return IconButton.styleFrom(
    disabledForegroundColor: colors.onSurface.withOpacity(0.38),
    disabledBackgroundColor:
        selected ? colors.onSurface.withOpacity(0.12) : null,
    side: selected ? null : BorderSide(color: colors.outline.withOpacity(0.12)),
  );
}
