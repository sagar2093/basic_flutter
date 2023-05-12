import 'package:basic_flutter/src/common/extensions/context_ext.dart';
import 'package:basic_flutter/src/ui/components/action_content.dart';
import 'package:basic_flutter/src/ui/components/communication_content.dart';
import 'package:flutter/material.dart';

import '../common/ui/group_header.dart';
import 'components/bottom_sheet_content.dart';
import 'components/card_content.dart';
import 'components/carousel_content.dart';
import 'components/dialog_content.dart';
import 'components/divider_content.dart';
import 'components/list_content.dart';
import 'components/selection_content.dart';
import 'components/side_sheets_content.dart';
import 'components/tooltips_content.dart';

class BasicContent extends StatelessWidget {
  const BasicContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ...[
          const GroupHeader("Actions"),
          ...[
            "Buttons",
            "Extended FAB",
            "FAB",
            "Icon Buttons",
            "Icon Button Toggles",
            "Segmented Button",
          ].map((e) => ListTile(
                title: Text(e),
                onTap: () {
                  context.navigateToDynamicScreen(
                      "Actions", const ActionContent());
                },
              )),
        ],
        ...[
          const GroupHeader("Communication"),
          ...[
            "Badges",
            "Progress Indicators",
            "Snackbar",
          ].map((e) => ListTile(
            title: Text(e),
            onTap: () {
              context.navigateToDynamicScreen(
                  "Communication", const CommunicationContent());
            },
          )),
        ],
        ...[
          const GroupHeader("Containment"),
          ListTile(
              title: const Text("Bottom Sheets"),
              onTap: () {
                context.navigateToDynamicScreen(
                    "Bottom Sheets", const BottomSheetContent());
              }),
          ListTile(
              title: const Text("Cards"),
              onTap: () {
                context.navigateToDynamicScreen("Cards", const CardContent());
              }),
          ListTile(
              title: const Text("Carousel"),
              onTap: () {
                context.navigateToDynamicScreen(
                    "Carousel", const CarouselContent());
              }),
          ListTile(
              title: const Text("Dialogs"),
              onTap: () {
                context.navigateToDynamicScreen(
                    "Dialogs", const DialogContent());
              }),
          ListTile(
              title: const Text("Dividers"),
              onTap: () {
                context.navigateToDynamicScreen(
                    "Dividers", const DividerContent());
              }),
          ListTile(
              title: const Text("List"),
              onTap: () {
                context.navigateToDynamicScreen("List", const ListContent());
              }),
          ListTile(
              title: const Text("Side Sheets"),
              onTap: () {
                context.navigateToDynamicScreen(
                    "Side Sheets", const SideSheetsContent());
              }),
          ListTile(
              title: const Text("Tooltips"),
              onTap: () {
                context.navigateToDynamicScreen(
                    "Tooltips", const TooltipsContent());
              }),
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
          ...[
            "Checkbox",
            "Chips",
            "Date Pickers",
            "Menus",
            "Radio Button",
            "Sliders",
            "Switch",
            "Time Pickers",
          ].map((e) => ListTile(
                title: Text(e),
                onTap: () {
                  context.navigateToDynamicScreen(
                      "Selection", const SelectionContent());
                },
              )),
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
