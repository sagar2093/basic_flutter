import 'package:flutter/material.dart';

class GroupHeader extends StatelessWidget {
  const GroupHeader(this.title, {Key? key}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Divider(height: 1),
        ListTile(
            title: Text(title, style: Theme.of(context).textTheme.titleLarge)),
        const Divider(height: 1),
      ],
    );
  }
}
