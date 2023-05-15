import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class CarouselContent extends StatelessWidget {
  const CarouselContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var packageUrl = "https://pub.dev/packages/carousel_slider";
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("TODO: Carousel"),
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
