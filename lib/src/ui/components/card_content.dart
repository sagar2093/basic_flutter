
import 'package:basic_flutter/res/dimens.dart';
import 'package:flutter/material.dart';

/// Ref: https://api.flutter.dev/flutter/material/Card-class.html
class CardContent extends StatelessWidget {
  const CardContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Column(
        children: [
          gh8x2,
          const Card(
            child: SizedBox(
              width: 300,
              height: 100,
              child: Center(child: Text('Elevated Card')),
            ),
          ),
          gh8x2,
          Card(
            elevation: 0,
            color: Theme.of(context).colorScheme.surfaceVariant,
            child: const SizedBox(
              width: 300,
              height: 100,
              child: Center(child: Text('Filled Card')),
            ),
          ),
          gh8x2,
          Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Theme.of(context).colorScheme.outline,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
            child: const SizedBox(
              width: 300,
              height: 100,
              child: Center(child: Text('Outlined Card')),
            ),
          ),
          gh8x2,
          Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                  leading: Icon(Icons.album),
                  title: Text('The Enchanted Nightingale'),
                  subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    TextButton(
                      child: const Text('BUY TICKETS'),
                      onPressed: () {/* ... */},
                    ),
                    const SizedBox(width: 8),
                    TextButton(
                      child: const Text('LISTEN'),
                      onPressed: () {/* ... */},
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
              ],
            ),
          ),
          gh8x2,
          Card(
            // clipBehavior is necessary because, without it, the InkWell's animation
            // will extend beyond the rounded edges of the [Card] (see https://github.com/flutter/flutter/issues/109776)
            // This comes with a small performance cost, and you should not set [clipBehavior]
            // unless you need it.
            clipBehavior: Clip.hardEdge,
            child: InkWell(
              splashColor: Colors.blue.withAlpha(30),
              onTap: () {
                //debugPrint('Card tapped.');
              },
              child: const SizedBox(
                width: 300,
                height: 100,
                child: Center(child: Text('A card that can be tapped')),
              ),
            ),
          ),
          gh8x2,
        ],
      ),
    );
  }
}
