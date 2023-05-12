import 'package:basic_flutter/src/common/extensions/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:material_3_demo/demo_m3.dart';
import 'package:url_launcher/url_launcher.dart';

import '../common/ui/group_header.dart';
import '../settings/settings_view.dart';
import 'basic_content.dart';

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
          GroupHeader("Flutter Favorites"),
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
    return ListView(children: [
      ListTile(
        title: const Text("M3 Demo"),
        subtitle: const Text(
            "https://github.com/flutter/samples/tree/main/material_3_demo"),
        onTap: () {
          context.navigateToCustomScreen(builder: (c) {
            return const M3DemoApp();
          });
        },
      ),
      ...quickLinks.entries
          .map((e) => ListTile(
                title: Text(e.key),
                subtitle: Text(e.value),
                onTap: () {
                  _launchUrl(Uri.parse(e.value));
                },
              ))
          .toList(),
    ]);
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
