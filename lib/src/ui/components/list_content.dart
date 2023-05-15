import 'package:basic_flutter/res/dimens.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

enum RadioOption { yes, no }

class ListContent extends StatefulWidget {
  const ListContent({Key? key}) : super(key: key);

  @override
  State<ListContent> createState() => _ListContentState();
}

class _ListContentState extends State<ListContent> {
  bool _cbValue = false;
  RadioOption? _radioOption;
  bool _lights = false;
  bool _isSelected = false;

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

    return SingleChildScrollView(
      child: Column(
        children: [
          const LisTileTransitions(),
          const ListTileCards(),
          gh8x2,
          CheckboxListTile(
            value: _cbValue,
            onChanged: (value) {
              setState(() {
                _cbValue = value ?? false;
              });
            },
            title: const Text("CheckboxListTile"),
          ),
          gh8x2,
          SwitchListTile(
            title: const Text('Lights [SwitchListTile]'),
            value: _lights,
            onChanged: (bool value) {
              setState(() {
                _lights = value;
              });
            },
            secondary: const Icon(Icons.lightbulb_outline),
          ),
          gh8x2,
          SwitchListTile.adaptive(
            title: const Text('Lights [SwitchListTile.adaptive]'),
            value: _lights,
            onChanged: (bool value) {
              setState(() {
                _lights = value;
              });
            },
            secondary: const Icon(Icons.lightbulb_outline),
          ),
          gh8x2,
          LinkedLabelSwitch(
            label: 'Linked, tappable label text',
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            value: _isSelected,
            onChanged: (bool newValue) {
              setState(() {
                _isSelected = newValue;
              });
            },
          ),
          gh8x2,
          LabeledSwitch(
            label: 'This is the label text',
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            value: _isSelected,
            onChanged: (bool newValue) {
              setState(() {
                _isSelected = newValue;
              });
            },
          ),
          gh8x2,
          const Text("RadioListTile Example"),
          RadioListTile<RadioOption>(
            groupValue: _radioOption,
            value: RadioOption.yes,
            onChanged: (value) {
              setState(() {
                _radioOption = value;
              });
            },
            title: const Text("Yes"),
          ),
          RadioListTile(
            groupValue: _radioOption,
            value: RadioOption.no,
            onChanged: (value) {
              setState(() {
                _radioOption = value;
              });
            },
            title: const Text("No"),
          ),
          gh8x2,
          AboutListTile(
            icon: const Icon(Icons.info),
            applicationIcon: const FlutterLogo(),
            applicationName: 'Basic Flutter App',
            applicationVersion: 'August 2019',
            applicationLegalese: '\u{a9} 2014 The Flutter Authors',
            aboutBoxChildren: aboutBoxChildren,
          ),
          gh8x2,
          const Text("CustomListItem Examples"),
          const CustomListItemExamples(),
          gh8x2,
          const Text("CustomListItemTwo Examples"),
          const CustomListItemTwoExamples()
        ],
      ),
    );
  }
}

class LinkedLabelSwitch extends StatelessWidget {
  const LinkedLabelSwitch({
    super.key,
    required this.label,
    required this.padding,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final EdgeInsets padding;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        children: <Widget>[
          Expanded(
            child: RichText(
              text: TextSpan(
                text: label,
                style: const TextStyle(
                  color: Colors.blueAccent,
                  decoration: TextDecoration.underline,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    showDialog(
                        context: context,
                        builder: (c) {
                          return AlertDialog(
                            title: const Text("Dialog"),
                            actions: [
                              TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text("OK"))
                            ],
                          );
                        });
                  },
              ),
            ),
          ),
          Switch(
            value: value,
            onChanged: (bool newValue) {
              onChanged(newValue);
            },
          ),
        ],
      ),
    );
  }
}

class LabeledSwitch extends StatelessWidget {
  const LabeledSwitch({
    super.key,
    required this.label,
    required this.padding,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final EdgeInsets padding;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      child: Padding(
        padding: padding,
        child: Row(
          children: <Widget>[
            Expanded(child: Text(label)),
            Switch(
              value: value,
              onChanged: (bool newValue) {
                onChanged(newValue);
              },
            ),
          ],
        ),
      ),
    );
  }
}

/// Ref: https://api.flutter.dev/flutter/material/ListTile-class.html
class LisTileTransitions extends StatefulWidget {
  const LisTileTransitions({super.key});

  @override
  State<LisTileTransitions> createState() => _LisTileTransitionsState();
}

class _LisTileTransitionsState extends State<LisTileTransitions>
    with TickerProviderStateMixin {
  late final AnimationController _fadeController;
  late final AnimationController _sizeController;
  late final Animation<double> _fadeAnimation;
  late final Animation<double> _sizeAnimation;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);

    _sizeController = AnimationController(
      duration: const Duration(milliseconds: 850),
      vsync: this,
    )..repeat(reverse: true);

    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    );

    _sizeAnimation = CurvedAnimation(
      parent: _sizeController,
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _sizeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Hero(
          tag: 'ListTile-Hero',
          // Wrap the ListTile in a Material widget so the ListTile has someplace
          // to draw the animated colors during the hero transition.
          child: Material(
            child: ListTile(
              title: const Text('ListTile with Hero'),
              subtitle: const Text('Tap here for Hero transition'),
              tileColor: Colors.cyan,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<Widget>(builder: (BuildContext context) {
                    return Scaffold(
                      appBar: AppBar(title: const Text('ListTile Hero')),
                      body: Center(
                        child: Hero(
                          tag: 'ListTile-Hero',
                          child: Material(
                            child: ListTile(
                              title: const Text('ListTile with Hero'),
                              subtitle: const Text('Tap here to go back'),
                              tileColor: Colors.blue[700],
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                );
              },
            ),
          ),
        ),
        FadeTransition(
          opacity: _fadeAnimation,
          // Wrap the ListTile in a Material widget so the ListTile has someplace
          // to draw the animated colors during the fade transition.
          child: const Material(
            child: ListTile(
              title: Text('ListTile with FadeTransition'),
              selectedTileColor: Colors.green,
              selectedColor: Colors.white,
              selected: true,
            ),
          ),
        ),
        SizedBox(
          height: 100,
          child: Center(
            child: SizeTransition(
              sizeFactor: _sizeAnimation,
              axisAlignment: -1.0,
              // Wrap the ListTile in a Material widget so the ListTile has someplace
              // to draw the animated colors during the size transition.
              child: const Material(
                child: ListTile(
                  title: Text('ListTile with SizeTransition'),
                  tileColor: Colors.red,
                  minVerticalPadding: 25.0,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ListTileCards extends StatelessWidget {
  const ListTileCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const <Widget>[
        Card(child: ListTile(title: Text('One-line ListTile'))),
        Card(
          child: ListTile(
            leading: FlutterLogo(),
            title: Text('One-line with leading widget'),
          ),
        ),
        Card(
          child: ListTile(
            title: Text('One-line with trailing widget'),
            trailing: Icon(Icons.more_vert),
          ),
        ),
        Card(
          child: ListTile(
            leading: FlutterLogo(),
            title: Text('One-line with both widgets'),
            trailing: Icon(Icons.more_vert),
          ),
        ),
        Card(
          child: ListTile(
            title: Text('One-line dense ListTile'),
            dense: true,
          ),
        ),
        Card(
          child: ListTile(
            leading: FlutterLogo(size: 56.0),
            title: Text('Two-line ListTile'),
            subtitle: Text('Here is a second line'),
            trailing: Icon(Icons.more_vert),
          ),
        ),
        Card(
          child: ListTile(
            leading: FlutterLogo(size: 72.0),
            title: Text('Three-line ListTile'),
            subtitle:
                Text('A sufficiently long subtitle warrants three lines.'),
            trailing: Icon(Icons.more_vert),
            isThreeLine: true,
          ),
        ),
      ],
    );
  }
}

class CustomListItem extends StatelessWidget {
  const CustomListItem({
    super.key,
    required this.thumbnail,
    required this.title,
    required this.user,
    required this.viewCount,
  });

  final Widget thumbnail;
  final String title;
  final String user;
  final int viewCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: thumbnail,
          ),
          Expanded(
            flex: 3,
            child: _VideoDescription(
              title: title,
              user: user,
              viewCount: viewCount,
            ),
          ),
          const Icon(
            Icons.more_vert,
            size: 16.0,
          ),
        ],
      ),
    );
  }
}

class _VideoDescription extends StatelessWidget {
  const _VideoDescription({
    required this.title,
    required this.user,
    required this.viewCount,
  });

  final String title;
  final String user;
  final int viewCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14.0,
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Text(
            user,
            style: const TextStyle(fontSize: 10.0),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
          Text(
            '$viewCount views',
            style: const TextStyle(fontSize: 10.0),
          ),
        ],
      ),
    );
  }
}

class CustomListItemExamples extends StatelessWidget {
  const CustomListItemExamples({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(8.0),
              itemExtent: 106.0,
              children: <CustomListItem>[
                CustomListItem(
                  user: 'Flutter',
                  viewCount: 999000,
                  thumbnail: Container(
                    decoration: const BoxDecoration(color: Colors.blue),
                  ),
                  title: 'The Flutter YouTube Channel',
                ),
                CustomListItem(
                  user: 'Dash',
                  viewCount: 884000,
                  thumbnail: Container(
                    decoration: const BoxDecoration(color: Colors.yellow),
                  ),
                  title: 'Announcing Flutter 1.0',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ArticleDescription extends StatelessWidget {
  const _ArticleDescription({
    required this.title,
    required this.subtitle,
    required this.author,
    required this.publishDate,
    required this.readDuration,
  });

  final String title;
  final String subtitle;
  final String author;
  final String publishDate;
  final String readDuration;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 2.0)),
              Text(
                subtitle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
        //Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              author,
              style: const TextStyle(
                fontSize: 12.0,
                color: Colors.black87,
              ),
            ),
            Text(
              '$publishDate - $readDuration',
              style: const TextStyle(
                fontSize: 12.0,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class CustomListItemTwo extends StatelessWidget {
  const CustomListItemTwo({
    super.key,
    required this.thumbnail,
    required this.title,
    required this.subtitle,
    required this.author,
    required this.publishDate,
    required this.readDuration,
  });

  final Widget thumbnail;
  final String title;
  final String subtitle;
  final String author;
  final String publishDate;
  final String readDuration;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        height: 124,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1.0,
              child: thumbnail,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 0.0, 2.0, 0.0),
                child: _ArticleDescription(
                  title: title,
                  subtitle: subtitle,
                  author: author,
                  publishDate: publishDate,
                  readDuration: readDuration,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomListItemTwoExamples extends StatelessWidget {
  const CustomListItemTwoExamples({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(10.0),
              children: <Widget>[
                CustomListItemTwo(
                  thumbnail: Container(
                    decoration: const BoxDecoration(color: Colors.pink),
                  ),
                  title: 'Flutter 1.0 Launch',
                  subtitle:
                      'Flutter continues to improve and expand its horizons. '
                      'This text should max out at two lines and clip',
                  author: 'Dash',
                  publishDate: 'Dec 28',
                  readDuration: '5 mins',
                ),
                CustomListItemTwo(
                  thumbnail: Container(
                    decoration: const BoxDecoration(color: Colors.blue),
                  ),
                  title:
                      'Flutter 1.2 Release - Continual updates to the framework',
                  subtitle: 'Flutter once again improves and makes updates.',
                  author: 'Flutter',
                  publishDate: 'Feb 26',
                  readDuration: '12 mins',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
