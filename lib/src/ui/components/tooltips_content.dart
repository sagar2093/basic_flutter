
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class TooltipsContent extends StatelessWidget {
  const TooltipsContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var packageUrl = "https://m3.material.io/components/tooltips/overview";
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("TODO: Tooltips"),
          Text(packageUrl),
          ElevatedButton(
              onPressed: () async {
                if (await canLaunchUrlString(packageUrl)) {
                  launchUrlString(packageUrl);
                }
              },
              child: const Text("Open Link"))
        ],
      ),
    );
  }
}