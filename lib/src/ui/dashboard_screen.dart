import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../settings/settings_view.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  static const routeName = "DashboardScreen";

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Gallery"),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.view_list_outlined),
            selectedIcon: Icon(Icons.view_list),
            label: 'Basic',
          ),
          NavigationDestination(
            icon: Icon(Icons.view_compact),
            selectedIcon: Icon(Icons.view_compact_outlined),
            label: 'Advanced',
          ),
          NavigationDestination(
            icon: Icon(Icons.source_outlined),
            selectedIcon: Icon(Icons.source),
            label: 'Resources',
          ),
        ],
      ),
      body: <Widget>[
        const BasicContent(),
        const AdvancedContent(),
        const QuickLinksList(),
      ][currentPageIndex],
    );
  }
}

class BasicContent extends StatelessWidget {
  const BasicContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ...[
          Text("Actions"),
          ListTile(title: Text("Buttons")),
          ListTile(title: Text("Extended FAB")),
          ListTile(title: Text("FAB")),
          ListTile(title: Text("Icon Buttons")),
          ListTile(title: Text("Segmented Button")),
        ],
        ...[
          Text("Communication"),
          ListTile(title: Text("Badges")),
          ListTile(title: Text("Progress Indicators")),
          ListTile(title: Text("Snackbar")),
        ],
        ...[
          Text("Containment"),
          ListTile(title: Text("Bottom Sheets")),
          ListTile(title: Text("Cards")),
          ListTile(title: Text("Carousel")),
          ListTile(title: Text("Dialogs")),
          ListTile(title: Text("Dividers")),
          ListTile(title: Text("List")),
          ListTile(title: Text("Side Sheets")),
          ListTile(title: Text("Tooltips")),
        ],
        ...[
          Text("Navigation"),
          ListTile(title: Text("Bottom App Bar")),
          ListTile(title: Text("Navigation Bar")),
          ListTile(title: Text("Navigation Drawer")),
          ListTile(title: Text("Navigation Rail")),
          ListTile(title: Text("Search")),
          ListTile(title: Text("Tabs")),
          ListTile(title: Text("Top App Bar")),
        ],
        ...[
          Text("Selection"),
          ListTile(title: Text("Checkbox")),
          ListTile(title: Text("Chips")),
          ListTile(title: Text("Date Pickers")),
          ListTile(title: Text("Menus")),
          ListTile(title: Text("Radio Button")),
          ListTile(title: Text("Sliders")),
          ListTile(title: Text("Switch")),
          ListTile(title: Text("Time Pickers")),
        ],
        ...[
          Text("Other"),
          ListTile(title: Text("Text Inputs")),
          ListTile(title: Text("Color Schemes")),
        ]
      ],
    );
  }
}

class AdvancedContent extends StatelessWidget {
  const AdvancedContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ListTile(title: Text("Themes")),
        ListTile(title: Text("Localization")),
        ListTile(title: Text("Fonts")),
        ...[
          Text("Flutter Favorite"),
          ListTile(title: Text("Shared Preferences")),
          ListTile(title: Text("Url Launcher")),
          ListTile(title: Text("Image Picker")),
          ListTile(title: Text("File Picker")),
          ListTile(title: Text("Video Player")),
        ],

      ],
    );
  }
}

class QuickLinksList extends StatelessWidget {
  const QuickLinksList({Key? key}) : super(key: key);

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: quickLinks.entries
            .map((e) => ListTile(
                  title: Text(e.key),
                  subtitle: Text(e.value),
                  onTap: () {
                    _launchUrl(Uri.parse(e.value));
                  },
                ))
            .toList());
  }
}

Map<String, String> quickLinks = {
  "Material": "https://m3.material.io",
  "Material Blog": "https://material.io/blog",
  "Material Theme Builder": "https://m3.material.io/theme-builder",
  "Flutter": "https://flutter.dev",
  "Flutter Packages": "https://pub.dev",
  "Material Icons": "https://fonts.google.com/icons",
  "IconKitchen": "https://icon.kitchen",
};
