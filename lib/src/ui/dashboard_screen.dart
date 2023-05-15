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
        GroupHeader("Resource Usage"),
        ...[
          ListTile(title: Text("Themes")),
          ListTile(title: Text("Localization")),
          ListTile(title: Text("Fonts")),
        ],
        ...[
          GroupHeader("Flutter Plus"),
          ListTile(
            title: Text("Battery Plus"),
            subtitle: Text("https://pub.dev/packages/battery_plus"),
          ),
          ListTile(
            title: Text("Connectivity Plus"),
            subtitle: Text("https://pub.dev/packages/connectivity_plus"),
          ),
          ListTile(
            title: Text("Device Info Plus"),
            subtitle: Text("https://pub.dev/packages/device_info_plus"),
          ),
          ListTile(
            title: Text("Network Info Plus"),
            subtitle: Text("https://pub.dev/packages/network_info_plus"),
          ),
          ListTile(
            title: Text("Package Info Plus"),
            subtitle: Text("https://pub.dev/packages/package_info_plus"),
          ),
          ListTile(
            title: Text("Sensors Plus"),
            subtitle: Text("https://pub.dev/packages/share_plus"),
          ),
          ListTile(
            title: Text("Share Plus"),
            subtitle: Text("https://pub.dev/packages/sensors_plus"),
          ),
          ListTile(
            title: Text("Android Alarm Manager Plus"),
            subtitle:
                Text("https://pub.dev/packages/android_alarm_manager_plus"),
          ),
          ListTile(
            title: Text("Android Intent Plus"),
            subtitle: Text("https://pub.dev/packages/android_intent_plus"),
          ),
        ],
        ...[
          GroupHeader("Flutter Favorites (Selected Only)"),
          ListTile(title: Text("Shared Preferences")),
          ListTile(title: Text("Url Launcher")),
          ListTile(title: Text("Image Picker")),
          ListTile(title: Text("File Picker")),
          ListTile(title: Text("Video Player")),
          ListTile(title: Text("Flutter Local Notifications")),
          ListTile(title: Text("Auto Size Text")),
          ListTile(title: Text("Flutter Slidable")),
          ListTile(title: Text("Infinite Scroll Pagination")),
          ListTile(title: Text("Drift")),

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
