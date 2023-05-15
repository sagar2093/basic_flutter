import 'package:basic_flutter/res/dimens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogContent extends StatelessWidget {
  const DialogContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final ThemeData theme = Theme.of(context);
    final TextStyle textStyle = theme.textTheme.bodyMedium!;
    final List<Widget> aboutBoxChildren = <Widget>[
      const SizedBox(height: 24),
      RichText(
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
                style: textStyle,
                text: "Flutter is Google's UI toolkit for building beautiful, "
                    'natively compiled applications for mobile, web, and desktop '
                    'from a single codebase. Learn more about Flutter at '),
            TextSpan(
                style: textStyle.copyWith(color: theme.colorScheme.primary),
                text: 'https://flutter.dev'),
            TextSpan(style: textStyle, text: '.'),
          ],
        ),
      ),
    ];

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextButton(
            onPressed: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => Dialog(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text('This is a typical dialog.'),
                      const SizedBox(height: 15),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Close'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            child: const Text('Dialog'),
          ),
          gh8x2,
          TextButton(
            onPressed: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => Dialog.fullscreen(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text('This is a fullscreen dialog.'),
                    const SizedBox(height: 15),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Close'),
                    ),
                  ],
                ),
              ),
            ),
            child: const Text('Fullscreen Dialog'),
          ),
          gh8x2,
          TextButton(
            onPressed: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => SimpleDialog(
                title: const Text("Simple Dialog"),
                children: [
                  const Text('This is a simple dialog children'),
                  const SizedBox(height: 15),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Close'),
                  ),
                ],
              ),
            ),
            child: const Text('Simple Dialog'),
          ),
          gh8x2,
          TextButton(
            onPressed: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                icon: const Icon(Icons.login),
                title: const Text("Alert Dialog"),
                content: const Text("Dialog Content"),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Cancel")),
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("OK")),
                ],
              ),
            ),
            child: const Text('Alert Dialog'),
          ),
          gh8x2,
          TextButton(
            onPressed: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => CupertinoAlertDialog(
                //icon: const Icon(Icons.login),
                title: const Text("Alert Dialog"),
                content: const Text("Dialog Content"),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Cancel")),
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("OK")),
                ],
              ),
            ),
            child: const Text('Cupertino Alert Dialog'),
          ),
          gh8x2,
          TextButton(onPressed: (){
            showAboutDialog(
              context: context,
              applicationIcon: const FlutterLogo(),
              applicationName: 'About Example',
              applicationVersion: 'August 2019',
              applicationLegalese: '\u{a9} 2014 The Flutter Authors',
              children: aboutBoxChildren,
            );
          }, child: const Text("About Dialog"))
        ],
      ),
    );
  }
}
