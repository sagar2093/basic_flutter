import 'package:basic_flutter/res/dimens.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CommunicationContent extends StatelessWidget {
  const CommunicationContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        BadgeContent(),
        Divider(),
        ProgressIndicatorsContent(),
        Divider(),
        SnackbarContent(),
        Divider(),
      ],
    );
  }
}

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
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Badges", style: Theme.of(context).textTheme.titleMedium),
        gh8x2,
        const Badge(),
        gh8x2,
        const Badge(label: Text("122")),
        gh8x2,
        const Badge(
          label: Text("123"),
          child: Icon(Icons.notifications),
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
            NavigationDestination(
              icon: Badge.count(count: 1000, child: Icon(Icons.mail)),
              label: "Mail",
            ),
            NavigationDestination(
              icon: Badge.count(
                  count: 10, child: Icon(Icons.chat_bubble_outline)),
              label: "Chat",
            ),
            const NavigationDestination(
              icon: Badge(child: Icon(Icons.groups_outlined)),
              label: "Rooms",
            ),
            NavigationDestination(
              icon: Badge.count(count: 3, child: Icon(Icons.videocam_outlined)),
              label: "Meet",
            ),
          ],
        ),
        gh8x2,
        const Text(
          "More badge options can be implemented from package Badges available at",
          textAlign: TextAlign.center,
        ),
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

class ProgressIndicatorsContent extends StatelessWidget {
  const ProgressIndicatorsContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("Progress Indicators", style: Theme.of(context).textTheme.titleMedium),
        gh8x2,
        const LinearProgressIndicator(),
        gh8x2,
        const CircularProgressIndicator(),
      ],
    );
  }
}

class SnackbarContent extends StatelessWidget {
  const SnackbarContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text('Show Snackbar'),
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('Awesome Snackbar!'),
              action: SnackBarAction(
                label: 'Action',
                onPressed: () {
                  // Code to execute.
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
