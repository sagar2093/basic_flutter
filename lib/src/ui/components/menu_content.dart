import 'package:basic_flutter/res/dimens.dart';
import 'package:basic_flutter/src/common/extensions/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MenuContent extends StatelessWidget {
  const MenuContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("Menus", style: Theme.of(context).textTheme.titleMedium),
        ElevatedButton(
            onPressed: () {
              context.navigateToDynamicScreen(
                  "Menu Anchor",
                  const CascadingMenuSample(
                      message: '"Talk less. Smile more." - A. Burr'));
            },
            child: const Text("Menu Anchor")),
        ElevatedButton(
            onPressed: () {
              context.navigateToDynamicScreen(
                  "MenuBar Sample 1",
                  const MenuBarSample(
                    message: '"Talk less. Smile more." - A. Burr',
                  ));
            },
            child: const Text("MenuBar Sample 1")),
        ElevatedButton(
            onPressed: () {
              context.navigateToDynamicScreen(
                  "MenuBar Sample 2", const MenuBarSampleAlt());
            },
            child: const Text("MenuBar Sample 2")),
        gh8x2,
        const DropdownMenuSample(),
      ],
    );
  }
}

class DropdownMenuSample extends StatefulWidget {
  const DropdownMenuSample({super.key});

  @override
  State<DropdownMenuSample> createState() => _DropdownMenuSampleState();
}

class _DropdownMenuSampleState extends State<DropdownMenuSample> {
  final TextEditingController colorController = TextEditingController();
  final TextEditingController iconController = TextEditingController();
  ColorLabel? selectedColor;
  IconLabel? selectedIcon;

  @override
  Widget build(BuildContext context) {
    final List<DropdownMenuEntry<ColorLabel>> colorEntries =
        <DropdownMenuEntry<ColorLabel>>[];
    for (final ColorLabel color in ColorLabel.values) {
      colorEntries.add(
        DropdownMenuEntry<ColorLabel>(
            value: color, label: color.label, enabled: color.label != 'Grey'),
      );
    }

    final List<DropdownMenuEntry<IconLabel>> iconEntries =
        <DropdownMenuEntry<IconLabel>>[];
    for (final IconLabel icon in IconLabel.values) {
      iconEntries
          .add(DropdownMenuEntry<IconLabel>(value: icon, label: icon.label));
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text("DropDownMenu", style: Theme.of(context).textTheme.titleMedium),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DropdownMenu<ColorLabel>(
                initialSelection: ColorLabel.green,
                controller: colorController,
                label: const Text('Color'),
                dropdownMenuEntries: colorEntries,
                onSelected: (ColorLabel? color) {
                  setState(() {
                    selectedColor = color;
                  });
                },
              ),
              const SizedBox(width: 20),
              DropdownMenu<IconLabel>(
                controller: iconController,
                enableFilter: true,
                leadingIcon: const Icon(Icons.search),
                label: const Text('Icon'),
                dropdownMenuEntries: iconEntries,
                inputDecorationTheme: const InputDecorationTheme(
                  filled: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                ),
                onSelected: (IconLabel? icon) {
                  setState(() {
                    selectedIcon = icon;
                  });
                },
              )
            ],
          ),
        ),
        if (selectedColor != null && selectedIcon != null)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                  'You selected a ${selectedColor?.label} ${selectedIcon?.label}'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Icon(
                  selectedIcon?.icon,
                  color: selectedColor?.color,
                ),
              )
            ],
          )
        else
          const Text('Please select a color and an icon.')
      ],
    );
  }
}

enum ColorLabel {
  blue('Blue', Colors.blue),
  pink('Pink', Colors.pink),
  green('Green', Colors.green),
  yellow('Yellow', Colors.yellow),
  grey('Grey', Colors.grey);

  const ColorLabel(this.label, this.color);

  final String label;
  final Color color;
}

enum IconLabel {
  smile('Smile', Icons.sentiment_satisfied_outlined),
  cloud(
    'Cloud',
    Icons.cloud_outlined,
  ),
  brush('Brush', Icons.brush_outlined),
  heart('Heart', Icons.favorite);

  const IconLabel(this.label, this.icon);

  final String label;
  final IconData icon;
}

/// An enhanced enum to define the available menus and their shortcuts.
///
/// Using an enum for menu definition is not required, but this illustrates how
/// they could be used for simple menu systems.
enum CascadingMenuEntry {
  about('About'),
  showMessage(
      'Show Message', SingleActivator(LogicalKeyboardKey.keyS, control: true)),
  hideMessage(
      'Hide Message', SingleActivator(LogicalKeyboardKey.keyS, control: true)),
  colorMenu('Color Menu'),
  colorRed('Red Background',
      SingleActivator(LogicalKeyboardKey.keyR, control: true)),
  colorGreen('Green Background',
      SingleActivator(LogicalKeyboardKey.keyG, control: true)),
  colorBlue('Blue Background',
      SingleActivator(LogicalKeyboardKey.keyB, control: true));

  const CascadingMenuEntry(this.label, [this.shortcut]);

  final String label;
  final MenuSerializableShortcut? shortcut;
}

class CascadingMenuSample extends StatefulWidget {
  const CascadingMenuSample({super.key, required this.message});

  final String message;

  @override
  State<CascadingMenuSample> createState() => _CascadingMenuSampleState();
}

class _CascadingMenuSampleState extends State<CascadingMenuSample> {
  CascadingMenuEntry? _lastSelection;
  final FocusNode _buttonFocusNode =
      FocusNode(debugLabel: 'Cascading Menu Button');
  ShortcutRegistryEntry? _shortcutsEntry;

  Color get backgroundColor => _backgroundColor;
  Color _backgroundColor = Colors.red;

  set backgroundColor(Color value) {
    if (_backgroundColor != value) {
      setState(() {
        _backgroundColor = value;
      });
    }
  }

  bool get showingMessage => _showingMessage;
  bool _showingMessage = false;

  set showingMessage(bool value) {
    if (_showingMessage != value) {
      setState(() {
        _showingMessage = value;
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Dispose of any previously registered shortcuts, since they are about to
    // be replaced.
    _shortcutsEntry?.dispose();
    // Collect the shortcuts from the different menu selections so that they can
    // be registered to apply to the entire app. Menus don't register their
    // shortcuts, they only display the shortcut hint text.
    final Map<ShortcutActivator, Intent> shortcuts =
        <ShortcutActivator, Intent>{
      for (final CascadingMenuEntry item in CascadingMenuEntry.values)
        if (item.shortcut != null)
          item.shortcut!: VoidCallbackIntent(() => _activate(item)),
    };
    // Register the shortcuts with the ShortcutRegistry so that they are
    // available to the entire application.
    _shortcutsEntry = ShortcutRegistry.of(context).addAll(shortcuts);
  }

  @override
  void dispose() {
    _shortcutsEntry?.dispose();
    _buttonFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        MenuAnchor(
          childFocusNode: _buttonFocusNode,
          menuChildren: <Widget>[
            MenuItemButton(
              child: Text(CascadingMenuEntry.about.label),
              onPressed: () => _activate(CascadingMenuEntry.about),
            ),
            if (_showingMessage)
              MenuItemButton(
                onPressed: () => _activate(CascadingMenuEntry.hideMessage),
                shortcut: CascadingMenuEntry.hideMessage.shortcut,
                child: Text(CascadingMenuEntry.hideMessage.label),
              ),
            if (!_showingMessage)
              MenuItemButton(
                onPressed: () => _activate(CascadingMenuEntry.showMessage),
                shortcut: CascadingMenuEntry.showMessage.shortcut,
                child: Text(CascadingMenuEntry.showMessage.label),
              ),
            SubmenuButton(
              menuChildren: <Widget>[
                MenuItemButton(
                  onPressed: () => _activate(CascadingMenuEntry.colorRed),
                  shortcut: CascadingMenuEntry.colorRed.shortcut,
                  child: Text(CascadingMenuEntry.colorRed.label),
                ),
                MenuItemButton(
                  onPressed: () => _activate(CascadingMenuEntry.colorGreen),
                  shortcut: CascadingMenuEntry.colorGreen.shortcut,
                  child: Text(CascadingMenuEntry.colorGreen.label),
                ),
                MenuItemButton(
                  onPressed: () => _activate(CascadingMenuEntry.colorBlue),
                  shortcut: CascadingMenuEntry.colorBlue.shortcut,
                  child: Text(CascadingMenuEntry.colorBlue.label),
                ),
              ],
              child: const Text('Background Color'),
            ),
          ],
          builder:
              (BuildContext context, MenuController controller, Widget? child) {
            return TextButton(
              focusNode: _buttonFocusNode,
              onPressed: () {
                if (controller.isOpen) {
                  controller.close();
                } else {
                  controller.open();
                }
              },
              child: const Text('OPEN MENU'),
            );
          },
        ),
        SizedBox(
          height: 200,
          child: Expanded(
            child: Container(
              alignment: Alignment.center,
              color: backgroundColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      showingMessage ? widget.message : '',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                  Text(_lastSelection != null
                      ? 'Last Selected: ${_lastSelection!.label}'
                      : ''),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _activate(CascadingMenuEntry selection) {
    setState(() {
      _lastSelection = selection;
    });

    switch (selection) {
      case CascadingMenuEntry.about:
        showAboutDialog(
          context: context,
          applicationName: 'MenuBar Sample',
          applicationVersion: '1.0.0',
        );
      case CascadingMenuEntry.hideMessage:
      case CascadingMenuEntry.showMessage:
        showingMessage = !showingMessage;
      case CascadingMenuEntry.colorMenu:
        break;
      case CascadingMenuEntry.colorRed:
        backgroundColor = Colors.red;
      case CascadingMenuEntry.colorGreen:
        backgroundColor = Colors.green;
      case CascadingMenuEntry.colorBlue:
        backgroundColor = Colors.blue;
    }
  }
}

class MenuBarEntry {
  const MenuBarEntry(
      {required this.label, this.shortcut, this.onPressed, this.menuChildren})
      : assert(menuChildren == null || onPressed == null,
            'onPressed is ignored if menuChildren are provided');
  final String label;

  final MenuSerializableShortcut? shortcut;
  final VoidCallback? onPressed;
  final List<MenuBarEntry>? menuChildren;

  static List<Widget> build(List<MenuBarEntry> selections) {
    Widget buildSelection(MenuBarEntry selection) {
      if (selection.menuChildren != null) {
        return SubmenuButton(
          menuChildren: MenuBarEntry.build(selection.menuChildren!),
          child: Text(selection.label),
        );
      }
      return MenuItemButton(
        shortcut: selection.shortcut,
        onPressed: selection.onPressed,
        child: Text(selection.label),
      );
    }

    return selections.map<Widget>(buildSelection).toList();
  }

  static Map<MenuSerializableShortcut, Intent> shortcuts(
      List<MenuBarEntry> selections) {
    final Map<MenuSerializableShortcut, Intent> result =
        <MenuSerializableShortcut, Intent>{};
    for (final MenuBarEntry selection in selections) {
      if (selection.menuChildren != null) {
        result.addAll(MenuBarEntry.shortcuts(selection.menuChildren!));
      } else {
        if (selection.shortcut != null && selection.onPressed != null) {
          result[selection.shortcut!] =
              VoidCallbackIntent(selection.onPressed!);
        }
      }
    }
    return result;
  }
}

class MenuBarSample extends StatefulWidget {
  const MenuBarSample({
    super.key,
    required this.message,
  });

  final String message;

  @override
  State<MenuBarSample> createState() => _MenuBarSampleState();
}

class _MenuBarSampleState extends State<MenuBarSample> {
  ShortcutRegistryEntry? _shortcutsEntry;
  String? _lastSelection;

  Color get backgroundColor => _backgroundColor;
  Color _backgroundColor = Colors.red;

  set backgroundColor(Color value) {
    if (_backgroundColor != value) {
      setState(() {
        _backgroundColor = value;
      });
    }
  }

  bool get showingMessage => _showMessage;
  bool _showMessage = false;

  set showingMessage(bool value) {
    if (_showMessage != value) {
      setState(() {
        _showMessage = value;
      });
    }
  }

  @override
  void dispose() {
    _shortcutsEntry?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              child: MenuBar(
                children: MenuBarEntry.build(_getMenus()),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 200,
          child: Expanded(
            child: Container(
              alignment: Alignment.center,
              color: backgroundColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      showingMessage ? widget.message : '',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                  Text(_lastSelection != null
                      ? 'Last Selected: $_lastSelection'
                      : ''),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  List<MenuBarEntry> _getMenus() {
    final List<MenuBarEntry> result = <MenuBarEntry>[
      MenuBarEntry(
        label: 'Menu Demo [Click]',
        menuChildren: <MenuBarEntry>[
          MenuBarEntry(
            label: 'About',
            onPressed: () {
              showAboutDialog(
                context: context,
                applicationName: 'MenuBar Sample',
                applicationVersion: '1.0.0',
              );
              setState(() {
                _lastSelection = 'About';
              });
            },
          ),
          MenuBarEntry(
            label: showingMessage ? 'Hide Message' : 'Show Message',
            onPressed: () {
              setState(() {
                _lastSelection =
                    showingMessage ? 'Hide Message' : 'Show Message';
                showingMessage = !showingMessage;
              });
            },
            shortcut:
                const SingleActivator(LogicalKeyboardKey.keyS, control: true),
          ),
          // Hides the message, but is only enabled if the message isn't
          // already hidden.
          MenuBarEntry(
            label: 'Reset Message',
            onPressed: showingMessage
                ? () {
                    setState(() {
                      _lastSelection = 'Reset Message';
                      showingMessage = false;
                    });
                  }
                : null,
            shortcut: const SingleActivator(LogicalKeyboardKey.escape),
          ),
          MenuBarEntry(
            label: 'Background Color',
            menuChildren: <MenuBarEntry>[
              MenuBarEntry(
                label: 'Red Background',
                onPressed: () {
                  setState(() {
                    _lastSelection = 'Red Background';
                    backgroundColor = Colors.red;
                  });
                },
                shortcut: const SingleActivator(LogicalKeyboardKey.keyR,
                    control: true),
              ),
              MenuBarEntry(
                label: 'Green Background',
                onPressed: () {
                  setState(() {
                    _lastSelection = 'Green Background';
                    backgroundColor = Colors.green;
                  });
                },
                shortcut: const SingleActivator(LogicalKeyboardKey.keyG,
                    control: true),
              ),
              MenuBarEntry(
                label: 'Blue Background',
                onPressed: () {
                  setState(() {
                    _lastSelection = 'Blue Background';
                    backgroundColor = Colors.blue;
                  });
                },
                shortcut: const SingleActivator(LogicalKeyboardKey.keyB,
                    control: true),
              ),
            ],
          ),
        ],
      ),
    ];
    // (Re-)register the shortcuts with the ShortcutRegistry so that they are
    // available to the entire application, and update them if they've changed.
    _shortcutsEntry?.dispose();
    _shortcutsEntry =
        ShortcutRegistry.of(context).addAll(MenuBarEntry.shortcuts(result));
    return result;
  }
}

class MenuBarSampleAlt extends StatelessWidget {
  const MenuBarSampleAlt({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              child: MenuBar(
                children: <Widget>[
                  SubmenuButton(
                    menuChildren: <Widget>[
                      MenuItemButton(
                        onPressed: () {
                          showAboutDialog(
                            context: context,
                            applicationName: 'MenuBar Sample',
                            applicationVersion: '1.0.0',
                          );
                        },
                        child: const MenuAcceleratorLabel('&About'),
                      ),
                      MenuItemButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Saved!'),
                            ),
                          );
                        },
                        child: const MenuAcceleratorLabel('&Save'),
                      ),
                      MenuItemButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Quit!'),
                            ),
                          );
                        },
                        child: const MenuAcceleratorLabel('&Quit'),
                      ),
                    ],
                    child: const MenuAcceleratorLabel('&File'),
                  ),
                  SubmenuButton(
                    menuChildren: <Widget>[
                      MenuItemButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Magnify!'),
                            ),
                          );
                        },
                        child: const MenuAcceleratorLabel('&Magnify'),
                      ),
                      MenuItemButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Minify!'),
                            ),
                          );
                        },
                        child: const MenuAcceleratorLabel('Mi&nify'),
                      ),
                    ],
                    child: const MenuAcceleratorLabel('&View'),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 200,
          child: Expanded(
            child: FlutterLogo(
              size: MediaQuery.of(context).size.shortestSide * 0.5,
            ),
          ),
        ),
      ],
    );
  }
}
