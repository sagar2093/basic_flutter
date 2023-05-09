import 'package:basic_flutter/res/dimens.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BadgeContent extends StatefulWidget {
  const BadgeContent({Key? key}) : super(key: key);

  @override
  State<BadgeContent> createState() => _BadgeContentState();
}

class _BadgeContentState extends State<BadgeContent> {
  var currentPageIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Badge(),
        gh8x2,
        const Badge(label: Text("122")),
        gh8x2,
        const Badge(
          label: Text("123"),
          child: Text("456789"),
        ),
        gh8x2,
        const Badge(
          label: Text("123"),
          //child: Text("456789"),
          backgroundColor: Colors.green,
        ),
        gh8x2,
        NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          selectedIndex: currentPageIndex,
          destinations: [
            Stack(
              alignment: Alignment.centerRight,
              children: const [
                NavigationDestination(
                  icon: Icon(Icons.mail),
                  label: "Mail",
                ),
                Badge(
                  label: Text("99"),
                )
              ],
            ),
            NavigationDestination(
              icon: Stack(
                children: const [
                  Icon(Icons.chat_bubble_outline),
                  Badge(label: Text("10")),
                ],
              ),
              label: "Chat",
            ),
            NavigationDestination(
              icon: Stack(
                alignment: Alignment.topRight,
                children: const [Icon(Icons.groups_outlined), Badge()],
              ),
              label: "Rooms",
            ),
            NavigationDestination(
              icon: Stack(
                alignment: Alignment.topRight,
                children: const [
                  Icon(Icons.videocam_outlined),
                  Badge(
                    label: Text("3"),
                  ),
                ],
              ),
              label: "Meet",
            ),
          ],
        ),
        gh8x2,
        const Text(
            "More badge options can be implemented from package Badges available at"),
        FilledButton(
            onPressed: () {
              _launchUrl(Uri.parse("https://pub.dev/packages/badges"));
            },
            child: const Text("Badges"))
      ],
    );
  }

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
