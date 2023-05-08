import 'package:basic_flutter/src/common/extensions/context_ext.dart';
import 'package:basic_flutter/src/ui/components/icon_button_toggle.dart';
import 'package:basic_flutter/src/ui/components/segmented_button_content.dart';
import 'package:flutter/material.dart';

import '../common/ui/group_header.dart';
import 'components/button_content.dart';
import 'components/icon_button_content.dart';
import 'dynamic_screen.dart';

class BasicContent extends StatelessWidget {
  const BasicContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ...[
          const GroupHeader("Actions"),
          ListTile(
            title: const Text("Buttons"),
            onTap: () {
              context.navigateToCustomScreen(
                builder: (c) => const DynamicScreen(
                    title: "Buttons", content: ButtonContent()),
              );
            },
          ),
          ListTile(
            title: const Text("Extended FAB"),
            onTap: () {
              context.navigateToCustomScreen(
                builder: (c) =>
                    const DynamicScreen(title: "FAB", content: FabContent()),
              );
            },
          ),
          ListTile(
              title: const Text("FAB"),
              onTap: () {
                context.navigateToCustomScreen(
                  builder: (c) =>
                      const DynamicScreen(title: "FAB", content: FabContent()),
                );
              }),
          ListTile(
              title: const Text("Icon Buttons"),
              onTap: () {
                context.navigateToCustomScreen(
                  builder: (c) => const DynamicScreen(
                      title: "Icon Buttons", content: IconButtonContent()),
                );
              }),
          ListTile(
              title: const Text("Icon Button Toggles"),
              onTap: () {
                context.navigateToCustomScreen(
                  builder: (c) => const DynamicScreen(
                      title: "Icon Button Toggles",
                      content: IconButtonToggleContent()),
                );
              }),
          ListTile(
              title: const Text("Segmented Button"),
              onTap: () {
                context.navigateToCustomScreen(
                  builder: (c) => const DynamicScreen(
                      title: "Segmented Button",
                      content: SegmentedButtonContent()),
                );
              }),
        ],
        ...[
          const  GroupHeader("Communication"),
          ListTile(title: const Text("Badges"), onTap: () {}),
          ListTile(title: const Text("Progress Indicators"), onTap: () {}),
          ListTile(title: const Text("Snackbar"), onTap: () {}),
        ],
        ...[
          const GroupHeader("Containment"),
          ListTile(title: const Text("Bottom Sheets"), onTap: () {}),
          ListTile(title: const Text("Cards"), onTap: () {}),
          ListTile(title: const Text("Carousel"), onTap: () {}),
          ListTile(title: const Text("Dialogs"), onTap: () {}),
          ListTile(title: const Text("Dividers"), onTap: () {}),
          ListTile(title: const Text("List"), onTap: () {}),
          ListTile(title: const Text("Side Sheets"), onTap: () {}),
          ListTile(title: const Text("Tooltips"), onTap: () {}),
        ],
        ...[
          const GroupHeader("Navigation"),
          ListTile(title: const Text("Bottom App Bar"), onTap: () {}),
          ListTile(title: const Text("Navigation Bar"), onTap: () {}),
          ListTile(title: const Text("Navigation Drawer"), onTap: () {}),
          ListTile(title: const Text("Navigation Rail"), onTap: () {}),
          ListTile(title: const Text("Search"), onTap: () {}),
          ListTile(title: const Text("Tabs"), onTap: () {}),
          ListTile(title: const Text("Top App Bar"), onTap: () {}),
        ],
        ...[
          const GroupHeader("Selection"),
          ListTile(title: const Text("Checkbox"), onTap: () {}),
          ListTile(title: const Text("Chips"), onTap: () {}),
          ListTile(title: const Text("Date Pickers"), onTap: () {}),
          ListTile(title: const Text("Menus"), onTap: () {}),
          ListTile(title: const Text("Radio Button"), onTap: () {}),
          ListTile(title: const Text("Sliders"), onTap: () {}),
          ListTile(title: const Text("Switch"), onTap: () {}),
          ListTile(title: const Text("Time Pickers"), onTap: () {}),
        ],
        ...[
          const GroupHeader("Other"),
          ListTile(title: const Text("Text Inputs"), onTap: () {}),
          ListTile(title: const Text("Color Schemes"), onTap: () {}),
        ]
      ],
    );
  }
}
